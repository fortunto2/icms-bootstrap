{* ================================================================================ *}
{* =================== Список статей в архиве материалов ========================== *}
{* ================================================================================ *}
<div class="con_heading">{$heading}</div>
{if $items_count}
        {foreach key=id item=item from=$items}
<ul class="inline row-fluid">
    <li class="span6">
        <i class="icon-file"></i> <a href="{$item.url}">{$item.title}</a>
    </li>
    <li class="span3">
        <i class="icon-folder-open"></i> <a href="{$item.category_url}">{$item.category}</a>
    </li>
    <li class="span3">{$item.fdate}</li>
</ul>
        {/foreach}
{else}
    <p>{$LANG.ARHIVE_NO_MATERIALS}</p>
{/if}