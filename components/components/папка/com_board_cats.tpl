{* ==================== Cписок [под]рубрик доски объявлений ======================= *}
{if $category.is_can_add || $root_id==$category.id}
<div class="float_bar">
	<a href="/board/{if $root_id!=$category.id}{$category.id}/{/if}add.html">{$LANG.ADD_ADV}</a>
</div>
{/if}
<h1 class="con_heading">{$pagetitle} <a href="/rss/board/{if $root_id==$category.id}all{else}{$category.id}{/if}/feed.rss" title="{$LANG.RSS}"><img src="/images/markers/rssfeed.png" alt="{$LANG.RSS}"/></a></h1>
{if $cats}
<ul class="inline">
	{foreach key=tid item=cat from=$cats}
    <li class="inline3">             
		<img class="mrgr10" src="/upload/board/cat_icons/{$cat.icon}">
		<span><a  class="font18" href="/board/{$cat.id}">{$cat.title}</a> ({$cat.content_count})</span><br>	{if $cat.description} 
		<span>{$cat.description}</span><br>
		{/if}					
		<span>{$cat.ob_links}</span>
	</li>
	{/foreach}
</ul>
{/if}
{if $category.description}
<p class="usr_photos_notice"><i class="icon-info-sign"></i> {$category.description}</p>
{/if}