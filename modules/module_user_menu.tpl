<ul class="nav pull-right">
    <li class="dropdown">
	{if $newmsg.total}
    <a  href="#" class="dropdown-toggle" data-toggle="dropdown">{$nickname} <i class="icon-envelope"></i> <b class="caret"></b></a>
        {else}
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$nickname} <b class="caret"></b></a> 
    {/if}
	
	<ul class="dropdown-menu">

    <li class="my_profile">
        <a href="{profile_url login=$login}"><i class="icon-user"></i> {$nickname}</a>
    </li>

    {if $is_billing}
        <li class="my_balance">
            <a href="{profile_url login=$login}#upr_p_balance" title="Баланс"><i class="icon-th"></i> {if $balance}{$balance}{else}0{/if}</a>
        </li>
    {/if}

    {if $users_cfg.sw_msg}
    <li class="my_messages">
        {if $newmsg.total}
            <a class="has_new" href="/users/{$id}/messages{if !$newmsg.messages}-notices{/if}.html" title="{$LANG.NEW_MESSAGES}: {$newmsg.messages}, {$LANG.NEW_NOTICES}: {$newmsg.notices}"><i class=""></i> <i class="icon-envelope"></i> {$LANG.USERMENU_MESS} ({$newmsg.total})</a>
        {else}
            <a href="/users/{$id}/messages.html"><i class="icon-envelope"></i> {$LANG.USERMENU_MESS}</a>
        {/if}
    </li>
    {/if}

    {if $users_cfg.sw_blogs}
    <li class="my_blog">
        <a href="/blogs/my_blog.html"><i class="icon-book"></i> {$LANG.USERMENU_MY_BLOG}</a>
    </li>
    {/if}

    {if $users_cfg.sw_photo}
    <li class="my_photos">
        <a href="/users/{$id}/photoalbum.html"><i class="icon-picture"></i> {$LANG.USERMENU_PHOTOS}</a>
    </li>
    {/if}

    {if $is_can_add && !$is_admin}
    <li class="my_content">
        <a href="/content/my.html"><i class="icon-list-alt"></i> {$LANG.USERMENU_ARTICLES}</a>
    </li>

    <li class="add_content">
        <a href="/content/add.html"><i class="icon-edit"></i> {$LANG.USERMENU_ADD_ARTICLE}</a>
    </li>
    {/if}

    {if $is_admin}
    <li class="admin">
        <a href="/admin" target="_blank"><i class="icon-wrench"></i> {$LANG.USERMENU_ADMININTER}</a>
    </li>
    {/if}
                  <li class="divider"></li>
    <li>
        <a href="/logout"><i class="icon-off"></i> {$LANG.USERMENU_EXIT}</a>
    </li>

    </ul>
    </li>
</ul>