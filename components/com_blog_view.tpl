{* ================================================================================ *}
{* ========================= Просмотр блога  ====================================== *}
{* ================================================================================ *}
<ul class="con_rss_icon inline">
    <li><i class="icon-calendar"></i> {$blog.pubdate}</li>
	<li><i class="icon-star"></i> {$blog.rating|rating}</li>
	<li>
		<a href="/rss/{component}/{$blog.id}/feed.rss" title="{$LANG.RSS}">
        {$LANG.RSS} <i class="bac-share"></i>
		</a>
	</li>
</ul>

<h1 class="con_heading">{$blog.title}</h1>

<div class="row-fluid">
    <div class="span7">
{* ============================== Автор блога ==================================== *}
{if !$myblog}
	{if $blog.ownertype == 'single'}
		<strong>{$LANG.BLOG_AVTOR}:</strong>
				{$blog.author}
	{else}
		<strong>{$LANG.BLOG_ADMIN}:</strong>
		{$blog.author}
        {if $blog.forall}
        <span>({$LANG.BLOG_OPENED_FOR_ALL})</span>
    {/if}
	{/if}
{/if}
	</div>
    <div class="span5 text-right">
{* ============================== Тулбар ==================================== *}
{if $myblog || $is_writer || $is_admin}
	{if $myblog || $is_admin}
		{if $on_moderate}
	<i class="icon-th"></i><a class="blog_moderate_link" href="{$blog.moderate_link}">{$LANG.MODERATING} ({$on_moderate})</a>
		{/if}						
	<i class="icon-pencil"></i><a href="{$blog.add_post_link}">{$LANG.NEW_POST}</a>
<span class="dropdown text-left">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-folder-open"></i> {$LANG.CATS}</a>
	<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
        <li>
			<a class="ajaxlink" href="javascript:void(0)" onclick="{component}.addBlogCat({$blog.id});return false;"><i class="icon-folder-open"></i> {$LANG.NEW_CAT}</a>
		</li>
		{if $cat_id>0}
        <li>
			<a class="ajaxlink" href="javascript:void(0)" onclick="{component}.editBlogCat({$cat_id});return false;"><i class="icon-edit"></i> {$LANG.RENAME_CAT}</a>
		</li>
        <li>
			<a class="ajaxlink" href="javascript:void(0)" onclick="{component}.deleteCat({$cat_id}, '{csrf_token}');return false;"><i class="icon-folder-open"></i> {$LANG.DEL_CAT}</a>
		</li>
        {/if}
    </ul>
</span>
    {if $is_config}
	<i class="icon-wrench"></i><a class="ajaxlink" href="javascript:void(0)" onclick="{component}.editBlog({$blog.id});return false;">{$LANG.CONFIG}</a>
    {/if}
	{elseif $is_writer}
		<i class="icon-pencil"></i><a href="{$blog.add_post_link}">{$LANG.NEW_POST}</a>
	{/if}
{/if}	
	</div>
</div>
{* ============================== Список рубрик блога ==================================== *}
{if $blogcats}
<ul class="inline">
    <li>
		<i class="icon-folder-open"></i>
	{if $cat_id}
		<a href="{$blog.blog_link}">{$LANG.ALL_CATS}</a> <span style="color:#666666">({$all_total})</span>
	{else}
		{$LANG.ALL_CATS} <span class="muted">({$total})</span>
	{/if}
	</li>
	{foreach key=tid item=cat from=$blogcats}
    <li>
		<i class="icon-folder-open"></i>
	{if $cat_id!=$cat.id}
		<a href="{$blog.blog_link}/cat-{$cat.id}">{$cat.title}</a> <span class="muted">({$cat.post_count})</span>
		{else}
	{$cat.title} <span class="muted">({$cat.post_count})</span>
    {assign var="cur_cat" value=$cat}
	{/if}
	</li>
	{/foreach}
</ul>

{if $cur_cat.description}
	<blockquote><i class="icon-info-sign"></i> {$cur_cat.description|nl2br}</blockquote>
{/if}
{/if}

{* ============================== Список записей блога ==================================== *}
{if $posts}
	<div class="blog_entries">
		{foreach key=tid item=post from=$posts}
		<div class="blog_entry">
			<h4><a href="{$post.url}">{$post.title}</a></h4>
			<div class="blog_entry_text">{$post.content_html}</div>			
	<ul class="inline">
		<li>
			<a class="blog_user" href="{profile_url login=$post.login}">
				<i class="icon-user"></i> {$post.author}
			</a>
		</li>
		<li>
			<i class="bac-date"></i> {if !$post.published}<span style="color:#CC0000">{$LANG.ON_MODERATE}</span>{else}{$post.fpubdate}{/if}
		</li>
		<li>
			<i class="icon-star"></i> {$post.rating|rating}
		</li>
		<li>
            {if ($post.comments_count > 0)}
                <a href="{$post.url}#c"><i class="icon-comment"></i> {$post.comments_count|spellcount:$LANG.COMMENT:$LANG.COMMENT2:$LANG.COMMENT10}</a>
                    {else}
                <a href="{$post.url}#c"><i class="icon-comment"></i> {$LANG.NOT_COMMENTS}</a>
            {/if}
		</li>	
		{if $post.tagline != false}
		<li>
			<i class="icon-tags"></i> {$post.tagline}		
		</li>		
		{/if}
	</ul>
		</div>
		{/foreach}		
	</div>	
	{$pagination}
{else}
	<p>{$LANG.NOT_POSTS}</p>
{/if}
