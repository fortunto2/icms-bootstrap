{* ================================================================================ *}
{* ==================== Список аватаров, доступных для выбора ===================== *}
{* ================================================================================ *}
<div class="con_heading">{$LANG.SELECTING_AVATAR}</div>
<blockquote>
	<p>{$LANG.CLICK_ON_AVATAR_TEXT}:</p>
</blockquote>
<ul class="inline">
    {foreach key=avatar_id item=avatar from=$avatars}
<li>
	<a href="/users/{$userid}/select-avatar/{$avatar_id}" title="{$LANG.SELECT_AVATAR}">
        <img src="{$avatars_dir}/{$avatar}">
    </a>
</li>
    {/foreach}
</ul> 
{$pagebar}