{* ================================================================================ *}
{* ================ Cписок [под]рубрик универсального каталога ==================== *}
{* ================================================================================ *}
<ul class="uc_cat_list">
	{foreach key=tid item=cat from=$cats}	
		<li class="uc_cat_item"><i class="icon-folder-open"></i> <a href="/catalog/{$cat.id}">{$cat.title}</a> ({$cat.content_count})</li>
	{/foreach}
</ul>