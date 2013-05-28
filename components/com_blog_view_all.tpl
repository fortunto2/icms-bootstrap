{* ================================================================================ *}
{* ========================= Список всех блогов =================================== *}
{* ================================================================================ *}
<h1 class="con_heading">{$LANG.BLOGS}</h1>

<div class="btn-group blog_type_menu">
    {if !$ownertype}
        <span class="btn active">{$LANG.POSTS_RSS}</span>
    {else}
        <a class="btn" href="/blogs">{$LANG.POSTS_RSS}</a>
    {/if}
	{if $ownertype == 'all'}
        <span class="btn active">{$LANG.ALL_BLOGS} ({$total})</span>
     {else}
        <a class="btn" href="/blogs/all.html">{$LANG.ALL_BLOGS}</a>
     {/if}
    {if $ownertype == 'single'}
        <span class="btn active">{$LANG.PERSONALS} ({$total})</span>
    {else}
        <a class="btn" href="/blogs/single.html">{$LANG.PERSONALS}</a>
    {/if}

    {if $ownertype == 'multi'}
        <span class="btn active">{$LANG.COLLECTIVES} ({$total})</span>
    {else}
        <a class="btn" href="/blogs/multi.html">{$LANG.COLLECTIVES}</a>
    {/if}
</div>
{if $blogs}
{foreach key=tid item=blog from=$blogs}
<blockquote>
<ul class="inline">
    <li>
		<a class="blog_title" href="{$blog.url}"><i class="bac-blog"></i> {$blog.title}</a>
	</li>
	{if $blog.ownertype =='single'}						
    <li>
		<a class="blog_user" href="{profile_url login=$blog.login}"><i class="icon-user"></i>  {$blog.nickname}</a>
	</li>
    {/if}
	<li><span class="blog_posts"><i class="icon-list-alt"></i> {$blog.records}</span></li>
	<li><span class="blog_comm"><i class="icon-comment"></i> {$blog.comments_count}</span></li> 
	{if $cfg.rss_one}
    <li>
        <a class="blog_rss" href="/rss/blogs/{$blog.id}/feed.rss"><i class="bac-share"></i></a>
    </li>
    {/if}
	<li>{$blog.rating|rating}</li>
</ul>
</blockquote>	
{/foreach}
	{if $cfg.rss_all}
		<div class="blogs_full_rss">
			<a href="/rss/blogs/all/feed.rss"><i class="bac-share"></i>{$LANG.BLOGS_RSS}</a>
		</div>
	{/if}
	{$pagination}	
{else}
	<p>{$LANG.NOT_ACTIVE_BLOGS}</p>
{/if}