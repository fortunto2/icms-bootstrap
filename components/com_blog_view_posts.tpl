<h2 class="con_heading">{$pagetitle}</h2>
<div class="btn-group blog_type_menu">
    <span class="btn active">{$LANG.POSTS_RSS} ({$total})</span>
    <a class="btn" href="/blogs/all.html">{$LANG.ALL_BLOGS}</a>
    <a class="btn" href="/blogs/single.html">{$LANG.PERSONALS}</a>
    <a class="btn" href="/blogs/multi.html">{$LANG.COLLECTIVES}</a>
</div>
{* ============================== Список записей блога ==================================== *}
{if $posts}
<div class="blog_entries">
	{foreach key=tid item=post from=$posts}
	<div class="blog_entry">
			<h4>
            {if $post.blog_url}
				<a href="{$post.blog_url}" class="muted">{$post.blog_title}</a> &rarr;
            {/if}
                <a href="{$post.url}">{$post.title}</a>
            </h4>												
			<p>{$post.content_html}</p>
<blockquote>
<ul class="inline">
	<li><a href="{profile_url login=$post.login}"><i class="icon-user"></i> {$post.author}</a></li>
	<li><i class="bac-date"></i> {if !$post.published} {$LANG.ON_MODERATE} {else} {$post.fpubdate}{/if}</li>
	<li><i class="icon-star"></i> {$post.rating|rating}</li>
	<li>
	{if ($post.comments_count > 0)}
		<a href="{$post.url}#c"><i class="icon-comment"></i> {$post.comments_count|spellcount:$LANG.COMMENT:$LANG.COMMENT2:$LANG.COMMENT10}</a>
				{else}
		<a href="{$post.url}#c"><i class="icon-comment"></i> {$LANG.NOT_COMMENTS}</a>
	{/if}
	</li>
	{if $post.tagline != false}
	<li><i class="icon-tags"></i> {$post.tagline}</li>
	{/if}
</ul>
</blockquote>
	</div>
		{/foreach}		
</div>	
	{$pagination}
{else}
	<p>{$LANG.NOT_POSTS}</p>
{/if}
