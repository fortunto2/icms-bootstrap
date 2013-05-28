{* ========================= Профиль удаленного пользователя ====================== *}
<div class="con_heading">{$usr.nickname}</div>						
<ul class="inline">
    <li class="inline3">
		<img class="img-polaroid" src="{$usr.avatar}" />
	</li>
	<li>
		<div class="text-error lead">{$LANG.USER_PROFILE_DELETED}</div>
		{if $is_admin}
            {if !$others_active}
                <div>{$LANG.YOU_CAN} <a href="/users/restoreprofile{$usr.id}.html">{$LANG.RESTORE_PROFILE}</a></div>
                {else}
                <div>{$LANG.CANT_RESTORE_PROFILE_TEXT} ({$usr.login}).</div>
            {/if}
		{/if}
	</li>
</ul>
