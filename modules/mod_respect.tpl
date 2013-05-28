{if $users}
	<ul class="media-list">
        {foreach key=id item=user from=$users}
        <li class="media">
			<img class="media-object pull-left" src="{$user.avatar}">
			<div class="media-body">
			 <a class="mod-respect" href="{profile_url login=$user.login}#upr_awards" title="{$user.nickname|escape:'html'}">{$user.nickname}</a>
			{if $cfg.show_awards}
                <div style="margin-top:6px">
                    {foreach key=id item=award from=$user.awards}
                        <img src="/images/icons/award.gif" border="0" title="{$award.title|escape:'html'}" />
                    {/foreach}
                </div>
            {/if}
			</div>	
		</li>
        {/foreach}
	</ul>
{else}
    <p>Нет достойных.</p>
{/if}