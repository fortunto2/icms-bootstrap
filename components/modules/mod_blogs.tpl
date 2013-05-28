<div class="blogsmod">
	<ul>
		{foreach key=tid item=post from=$posts}
        <li class="blog-item">
			<a class="img-polaroid" href="{profile_url login=$post.login}" title="{$post.author|escape:'html'}">
				<img src="{$post.author_avatar}">
			</a>
		<div>
			<a href="{$post.url}" title="{$post.title|escape:'html'}"><strong>{$post.title|truncate:70}</strong></a>
		</div>
        <div class="mod_latest_date">
            {$post.fpubdate} <i class="bac-vect-comment-bubble"></i> <a href="{$post.url}#c" title="{$post.comments_count|spellcount:$LANG.COMMENT1:$LANG.COMMENT2:$LANG.COMMENT10}" class="mod_latest_comments">{$post.comments_count}</a> - <span class="mod_latest_rating"><i class="icon-star"></i> {$post.rating|rating}</span>
        </div>
		</li>
		{/foreach}
	</ul>
</div>
{if $cfg.showrss}
    <div class="mod_latest_rss">
        <a href="/rss/blogs/all/feed.rss"><i class="bac-share"></i>{$LANG.RSS}</a>
    </div>
{/if}