{if $cfg.view_type == 'table'}
  <ul class="media-list">
  {foreach key=aid item=usr from=$usrs}
    <li class="media">
		<a class="pull-left" href="{profile_url login=$usr.login}">
			<img class="media-object" src="{$usr.avatar}">
		</a>
		<div class="media-body">
			<strong class="media-heading"><a href="{profile_url login=$usr.login}">{$usr.nickname}</a></strong>
          	{if $usr.is_online}
            	<span class="online">{$LANG.ONLINE}</span>
            {else}
            <!-- Nested media object -->	
            {/if}
		</div>
    </li>
  {/foreach}
  </ul>
{/if}

{if $cfg.view_type == 'hr_table'}
    {assign var="col" value="1"}
          {foreach key=aid item=usr from=$usrs}
            {if $col==1} 
	<ul class="usr_friends_list"> {/if}
	<li class="usr_friend_cell">
		<a href="{profile_url login=$usr.login}" class="new_user_link hint  hint--top" data-hint="{$usr.nickname|escape:'html'}">
		<img class="usr_img_small" src="{$usr.avatar}" />
		</a>
	</li>
           {if $col==$cfg.maxcool} 
	</ul> {assign var="col" value="1"} {else} {math equation="x + 1" x=$col assign="col"} {/if}
          {/foreach}
{/if}

{if $cfg.view_type == 'list'}
    {assign var="now" value="0"}
        {foreach key=aid item=usr from=$usrs}
            <a href="{profile_url login=$usr.login}" class="new_user_link">{$usr.nickname}</a>{math equation="x + 1" x=$now assign="now"}{if $now==$total}{else},{/if}
        {/foreach}
        <p><strong>{$LANG.LASTREG_TOTAL}:</strong> {$total_all}</p>
{/if}