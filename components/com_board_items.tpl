{* ================================================================================ *}
{* ==================== Cписок объявлений (на доске объявлений) =================== *}
{* ================================================================================ *}
{if $page_title}<h1 class="con_heading">{$page_title}</h1>{/if}
{if $order_form}{$order_form}{/if}
	<div class="board_gallery">
	{if $items}
		<table width="100%" cellpadding="3" cellspacing="0" border="0">
			{assign var="col" value="1"}
            {assign var="is_moder" value="0"}
			{foreach key=tid item=con from=$items}									
				{if $col==1} <tr> {/if} 				
				<td valign="top" width="{$colwidth}%">
<div class="media">
	<span class="pull-left">
	{if $cfg.photos}	
		<img class="media-object" src="/images/board/small/{$con.file}" alt="{$con.title|escape:'html'}">	
	{/if}
	</span>
    <div class="media-body">
	<strong class="media-heading">
		<a href="/board/read{$con.id}.html" title="{$con.title|escape:'html'}">{$con.title}</a>
	</strong>
	<div class="bd_text">
		{$con.content|truncate:250}
	</div>
		<div class="bd_item_details">
            {if $cat.showdate && $con.published}
				<span class="muted"><i class="bac-date"></i> {$con.fpubdate}</span>
            {/if}
            {if !$con.published && $con.is_overdue}
                <span class="bd_item_status_bad"><i class="bac-date"></i> {$LANG.ADV_EXTEND_INFO}</span>
            {elseif !$con.published}
                <span class="bd_item_status_bad"><i class="bac-date"></i> {$LANG.WAIT_MODER}</span>
            {/if}
                <span class="bd_item_hits"><i class="icon-eye-open"></i> {$con.hits}</span>
			{if $con.city}
				<span class="bd_item_city"><a href="/board/city/{$con.enc_city|escape:'html'}"><i class="bac-building"></i> {$con.city}</a></span>
			{/if}
			{if $con.nickname}
				<span class="bd_item_user"><i class="bac-date"></i> <a href="{profile_url login=$con.login}">{$con.nickname}</a></span>
            {else}
                <span class="bd_item_user"><i class="bac-user"></i> {$LANG.BOARD_GUEST}</span>
			{/if}
            {if $con.cat_title}
                <span class="bd_item_cat"><i class="bac-date"></i> <a href="/board/{$con.category_id}">{$con.cat_title}</a></span>
										
            {/if}
			{if $con.moderator}
                {assign var="is_moder" value="1"}
                <span class="bd_item_edit"><a data-toggle="tooltip" data-original-title="{$LANG.EDIT}" href="/board/edit{$con.id}.html"><i class="bac-edit"></i></a></span>
                <span class="bd_item_delete"><a data-toggle="tooltip" data-original-title="{$LANG.DELETE}" href="/board/delete{$con.id}.html"><i class="bac-trashcan"></i></a></span>              
            {/if}
		</div>	
    </div>
</div>			
				</td> 
				{if $col==$maxcols} </tr> {assign var="col" value="1"} {else} {math equation="x + 1" x=$col assign="col"} {/if}
			{/foreach}
			{if $col>1} 
				<td colspan="{math equation="x - y + 1" x=$col y=$maxcols}">&nbsp;</td></tr>
			{/if}
		</table>
		{$pagebar}
	{elseif $cat.id != $root_id}
		<p>{$LANG.ADVS_NOT_FOUND}</p>
	{/if}
	</div>
{if $is_moder}
{literal}
<script type="text/javascript" language="JavaScript">
	$(document).ready(function(){
		$('.b_table_tr .bd_moderate_link').css({opacity:0.3, filter:'alpha(opacity=30)'});
		$('.b_table_tr').hover(
			function() {
				$(this).find('.bd_moderate_link').css({opacity:1.0, filter:'alpha(opacity=100)'});
			},
			function() {
				$(this).find('.bd_moderate_link').css({opacity:0.3, filter:'alpha(opacity=30)'});
			}
		);
	});
</script>
{/literal}
{/if}