{foreach key=tid item=usr from=$users} 
<div class="mod_user_rating">  
        <div class="avatar"><a href="{profile_url login=$usr.login}"><img class="img-polaroid" src="{$usr.avatar}" /></a></div>
                {$usr.user_link}
                {if $cfg.view_type == 'rating'}
                    <span class="btn btn-mini"><i class="icon-star-empty"></i> {$usr.rating|rating}</span>
                {else}
                    <span class="btn btn-mini"><i class="icon-star"></i> {$usr.karma|rating}</span>
                {/if}
				
                {if $usr.microstatus}
                	<p class="microstatus">{$usr.microstatus}</p>
                {/if}
</div>
{/foreach}
