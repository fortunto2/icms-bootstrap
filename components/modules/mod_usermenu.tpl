<ul class="mod_user_menu nav">
    <li class="my_profile">
        <a href="{profile_url login=$login}"><i class="bac-user"></i> {$nickname}</a>
    </li>
	<li class="separat"></li>
    {if $is_billing}
        <li class="my_balance">
            <a href="{profile_url login=$login}#upr_p_balance" title="Баланс">{if $balance}{$balance}{else}0{/if}</a>
        </li>
		<li class="separat"></li>
    {/if}

    {if $users_cfg.sw_msg}
    <li class="my_messages">
        {if $newmsg.total}
            <a class="has_new" href="/users/{$id}/messages{if !$newmsg.messages}-notices{/if}.html" title="{$LANG.NEW_MESSAGES}: {$newmsg.messages}, {$LANG.NEW_NOTICES}: {$newmsg.notices}"><i class="bac-message"></i> {$LANG.USERMENU_MESS} ({$newmsg.total})</a>
        {else}
            <a href="/users/{$id}/messages.html"><i class="bac-message"></i> {$LANG.USERMENU_MESS}</a>
        {/if}
    </li>
	<li class="separat"></li>
    {/if}

    {if $users_cfg.sw_blogs}
    <li class="my_blog">
        <a href="/blogs/my_blog.html"><i class="bac-blog"></i> {$LANG.USERMENU_MY_BLOG}</a>
    </li>
	<li class="separat"></li>
    {/if}

    {if $users_cfg.sw_photo}
    <li class="my_photos">
        <a href="/users/{$id}/photoalbum.html"><i class="bac-photo"></i> {$LANG.USERMENU_PHOTOS}</a>
    </li>
	<li class="separat"></li>
    {/if}

    {if $is_can_add && !$is_admin}
    <li class="my_content">
        <a href="/content/my.html"><i class="bac-ww-tjust"></i> {$LANG.USERMENU_ARTICLES}</a>
    </li>
	<li class="separat"></li>

    <li class="add_content">
        <a href="/content/add.html"><i class="bac-edit"></i> {$LANG.USERMENU_ADD_ARTICLE}</a>
    </li>
	<li class="separat"></li>
    {/if}

    {if $is_admin}
    <li class="admin">
        <a href="/admin" target="_blank"><i class="bac-settings"></i> {$LANG.USERMENU_ADMININTER}</a>
    </li>
	<li class="separat"></li>
    {/if}

    <li class="logout">
        <a href="/logout"><i class="bac-exit"></i> {$LANG.USERMENU_EXIT}</a>
    </li>
	<li class="separat"></li>
</ul>
