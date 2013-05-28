{* ================================================================================ *}
{* ==================== Просмотр объявления (на доске объявлений) ================= *}
{* ================================================================================ *}
<h1 class="con_heading">{$item.title}</h1>
<ul class="inline">
    {if $item.is_vip}
        <li class="bd_item_is_vip"><i class="icon-star"></i> {$LANG.VIP_ITEM}</li>
    {/if}
	<li class="bd_item_date"><i class="bac-date"></i> {$item.pubdate}</li>
    <li class="bd_item_hits"><i class="icon-eye-open"></i> {$item.hits}</li>
	{if $item.city}
		<li class="bd_item_city">
			<a href="/board/city/{$item.enc_city}"><i class="bac-building"></i> {$item.city}</a>
		</li>
	{/if}
	{if $item.user}
		<li class="bd_item_user">
			<a href="{profile_url login=$item.user_login}"><i class="bac-date"></i> {$item.user}</a>
		</li>
	{else}
    	<li class="bd_item_user">{$LANG.BOARD_GUEST}</li>
	{/if}
	{if $item.moderator}
		<li class="bd_item_edit"><a data-toggle="tooltip" title="{$LANG.EDIT}" href="/board/edit{$item.id}.html"><i class="bac-edit"></i></a></li>
        {if !$item.published && ($is_admin || $is_moder)}
        	<li><a data-toggle="tooltip" title="{$LANG.PUBLISH}" href="/board/publish{$item.id}.html"><i class="bac-vect-like"></i></a></li>
        {/if}
		<li class="bd_item_delete"><a data-toggle="tooltip" title="{$LANG.DELETE}" href="/board/delete{$item.id}.html"><i class="bac-trashcan"></i></a></li>
	{/if}
</ul>
<ul class="inline">
{if $item.file && $cfg.photos}
	<li class="inline100">	
		<img class="img-polaroid" src="/images/board/medium/{$item.file}" alt="{$item.title|escape:'html'}"/>
	</li>
{/if}
	<li class="inline100">
		<div class="well well-small">
            <p>{$item.content}</p>
            {if $formsdata}
                <table width="100%" cellspacing="0" cellpadding="2" style="border-top:1px solid #C3D6DF; margin:5px 0 0 0">
                    {foreach key=tid item=form from=$formsdata}
                    {if $form.field}
                        <tr>
                            <td valign="top" width="140px">
                                <strong>{$form.title}:</strong>
                            </td>
                            <td valign="top">
                                    {$form.field}
                            </td>
						</tr>
                    {/if}
                    {/foreach}
                </table>
            {/if}
        </div>
	</li>
</ul>

<div class="bd_links">
	{if $user_id}
		{if $item.user_id && $item.user_id != $user_id}
            {add_js file='components/users/js/profile.js'}
			<span class="bd_message"><a class="ajaxlink" title="{$LANG.WRITE_MESS_TO_AVTOR}" href="javascript:void(0)" onclick="users.sendMess('{$item.user_id}', 0, this);return false;"><i class="bac-message"></i> {$LANG.WRITE_MESS_TO_AVTOR}</a></span>
		{/if}
	{/if}
    {if $item.user_login}
	<span class="bd_author"><i class="bac-album"></i> <a href="/board/by_user_{$item.user_login}">{$LANG.ALL_AVTOR_ADVS}</a></span>
    {/if}
</div>

{if $cfg.comments}
    {comments target='boarditem' target_id=$item.id}
{/if}
