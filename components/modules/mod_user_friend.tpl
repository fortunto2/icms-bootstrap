{strip}
    <div class="moduletitle">
        {$LANG.FRIEND_ON_SITE} ({$total})
    </div>
    <div class="modulebody">
        {if $total}
			{if $cfg.view_type == 'table'}
                {foreach key=tid item=frien from=$friends}
					<a title="{$user.nickname}" class="mod_friend" href="{profile_url login=$frien.login}">
						<img class="usr_img_small" src="{$frien.avatar}" />
					</a>
                {/foreach}
                {/if}
                {if $cfg.view_type == 'list'}
                   {assign var="now" value="0"}
                       {foreach key=tid item=frien from=$friends}
                        {$frien.user_link}
                        {math equation="x + 1" x=$now assign="now"}
                        {if $now==$total}{else}, {/if}
                {/foreach}
        {/if}
        {else}
            {$LANG.FRIEND_NO_SITE}
        {/if} 
    </div>
{/strip}