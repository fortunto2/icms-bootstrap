{* ================================================================================ *}
{* ======================== Карма пользователя ==================================== *}
{* ================================================================================ *}
<h1 class="con_heading">{$LANG.KARMA_HISTORY} - {$usr.nickname}</h1>
{if $karma}
{foreach key=id item=karm from=$karma}
<blockquote>
<p><span>{$karm.fsenddate}</span> <a href="{profile_url login=$karm.login}">{$karm.nickname}</a> 	                {if $karm.kpoints>0} 
<span class="text-success">+{$karm.kpoints}</span>
{else}
<span class="text-error">{$karm.kpoints}</span>
{/if}</p>
</blockquote>
{/foreach}
{else}
<p>{$LANG.KARMA_NOT_MODIFY}</p>
<p>{$LANG.KARMA_NOT_MODIFY_TEXT}</p>
<p>{$LANG.KARMA_DESCRIPTION}</p>
{/if}