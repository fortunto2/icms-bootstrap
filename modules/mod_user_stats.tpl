<div id="mod_user_stats">
<strong>{$LANG.HOW_MUCH_US}</strong>
    {if $cfg.show_total}
	<ul class="nav nav-list">
		<li>{$total_usr|spellcount:$LANG.USER:$LANG.USER2:$LANG.USER10}</li>
	</ul>
    {/if}

    {if $cfg.show_online}
<strong>Кто онлайн?</strong>
    <ul class="nav nav-list">
        <li>{$people.users|spellcount:$LANG.USER:$LANG.USER2:$LANG.USER10}</li>
        <li>{$people.guests|spellcount:$LANG.GUEST:$LANG.GUEST2:$LANG.GUEST10}</li>
        <li>
            {if $usr_online}
                <a href="/users/all.html" rel="nofollow">{$LANG.SHOW_ALL}</a>
            {else}
				<a href="/users/online.html" rel="nofollow">{$LANG.SHOW_ONLY_ONLINE}</a>
            {/if}
        </li>
    </ul>
    {/if}

    {if $cfg.show_gender}
<strong>Кто мы?</strong>
    <ul class="nav nav-list">
        <li><a href="javascript:void(0)" rel=”nofollow” onclick="searchGender('m')">{$gender_stats.male|spellcount:$LANG.MALE1:$LANG.MALE2:$LANG.MALE10}</a></li>
        <li><a href="javascript:void(0)" rel=”nofollow” onclick="searchGender('f')">{$gender_stats.female|spellcount:$LANG.FEMALE1:$LANG.FEMALE2:$LANG.FEMALE10}</a></li>
        <li>{$LANG.UNKNOWN} &mdash; {$gender_stats.unknown}</li>
    </ul>
    {/if}

    {if $cfg.show_city}
<strong>{$LANG.WHERE_WE_FROM}</strong>
	<ul class="nav nav-list">
        {foreach key=tid item=city from=$city_stats}
            {if $city.href}
                <li><a href="{$city.href}" rel=”nofollow”>{$city.city} &mdash; {$city.count}</a></li>
                    {else}
                <li>{$city.city} &mdash; {$city.count}</li>
            {/if}
        {/foreach}
	</ul>
	{/if}

{if $cfg.show_bday && $bday}
<strong><i class="icon-gift"></i> {$LANG.TODAY_BIRTH}:</strong>
    {$bday}
{/if}

</div>
{literal}
<script type="text/javascript">
function searchGender(gender){
	$('body').append('<form id="sform" style="display:none" method="post" action="/users"><input type="hidden" name="gender" value="'+gender+'"/></form>');
	$('form#sform').submit();
}
</script>
{/literal}