{* ================================================================================ *}
{* ========================= Просмотр поста в блоге =============================== *}
{* ================================================================================ *}
{if $is_author || $is_admin || $is_moder}
    <div class="float_bar">
        {if !$post.published && ($is_admin || $is_moder)}<span id="pub_link"><a class="ajaxlink" href="javascript:void(0)" onclick="{component}.publishPost({$post.id});return false;">{$LANG.PUBLISH}</a> | </span>{/if}<a href="/{component}/editpost{$post.id}.html">{$LANG.EDIT}</a> | <a class="ajaxlink" href="javascript:void(0)" onclick="{component}.deletePost({$post.id}, '{csrf_token}');return false;">{$LANG.DELETE}</a>
    </div>
{/if}
<h1 class="con_heading">{$post.title}</h1>
<div>
<ul class="inline">
    <li style="text-align: center;">
	<div><strong>{$LANG.AVTOR}</strong></div>
    <div><a href="{profile_url login=$post.author_login}"><img class="img-polaroid" src="{$post.author_avatar}"></a></div>
    <div><strong><a href="{profile_url login=$post.author_login}">{$post.author_nickname}</a></strong></div>
	</li>
	<li>
	<div><strong>{$LANG.PUBLISHED}:</strong> {if !$post.published}<span id="pub_wait" style="color:#F00;">{$LANG.ON_MODERATE}</span><span id="pub_date" style="display:none;">{$post.fpubdate}</span>{else}{$post.fpubdate}{/if}</div>
	<div><strong>{$LANG.BLOG}:</strong> <a href="/{component}/{$blog.seolink}">{$blog.title}</a></div>
	{if $blog.showcats && $cat}
	<div><strong>{$LANG.CAT}:</strong> <a href="/{component}/{$blog.seolink}/cat-{$cat.id}">{$cat.title}</a></div>
	{/if}
	{if $post.edit_times}
	<div><strong>{$LANG.EDITED}:</strong> {$post.edit_times|spellcount:$LANG.TIME1:$LANG.TIME2:$LANG.TIME10} &mdash; {if $post.edit_times>1}{$LANG.LATS_TIME}{/if} {$post.feditdate}</div>
	{/if}
	{if $post.feel}
	<div><strong>{$LANG.MOOD}:</strong> {$post.feel}</div>
	{/if}
	{if $post.music}
	<div><strong>{$LANG.PLAYING}:</strong> {$post.music}</div>
	{/if}
	</li>
	<li>
	{$karma_form}
	</li>
</ul>
</div>
<div class="blog_post_body">{$post.content_html}</div>
{$post.tags}
{if $navigation && ($navigation.prev || $navigation.next)}
	<div class="well well-small">
    	{if $navigation.prev}<a href="{$navigation.prev.url}" class="prev"><i class="icon-arrow-left"></i>{$navigation.prev.title}</a>{/if}
        {if $navigation.next}<a href="{$navigation.next.url}" class="next">{$navigation.next.title} <i class="icon-arrow-right"></i></a>{/if}
    </div>
{/if}