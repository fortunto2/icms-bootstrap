{* ================================================================================ *}
{* ========================= Настройки клуба ====================================== *}
{* ================================================================================ *}
<script type="text/javascript" src="/templates/bootstrap_2_3_1//js/bootstrap-uploader.js"></script>
<div class="con_heading">
	<a href="/clubs/{$club.id}">{$club.title}</a> &rarr; {$LANG.CONFIG}
</div>
{add_js file='includes/jquery/tabs/jquery.ui.min.js'}
<form name="configform" id="club_config_form" action="" class="form-horizontal" method="post" enctype="multipart/form-data">
<ul class="nav nav-tabs">
	<li class="active"><a href="#about" data-toggle="tab"><span>{$LANG.CLUB_DESC}</span></a></li>
	<li><a href="#moders" data-toggle="tab"><span>{$LANG.MODERATORS}</span></a></li>
	<li><a href="#members" data-toggle="tab"><span>{$LANG.MEMBERS}</span></a></li>
{if $club.enabled_photos || $club.enabled_blogs}
    <li><a href="#limits" data-toggle="tab"><span>{$LANG.LIMITS}</span></a></li>
{/if}
{if $is_admin}
    <li><a href="#vip" data-toggle="tab"><span>VIP</span></a></li>
{/if}
</ul>
<div class="tab-content">
	<div class="tab-pane active" id="about">
<div class="control-group">
	<label class="control-label"><strong>{$LANG.CLUB_NAME}:</strong></label>
	<div class="controls">
		<input name="title"  type="text" value="{$club.title|escape:'html'}">
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="picture"><strong>{$LANG.UPLOAD_LOGO}:</strong></label>
	<div class="controls">
		<input name="picture" type="file" id="picture">
	</div>
</div>
		{wysiwyg name='description' value=$club.description height=350 width='100%'}
	</div>
	<div class="tab-pane" id="moders">
<blockquote>{$LANG.MODERATE_TEXT}</blockquote>
<div id="multiuserscfg">
<div class="controls controls-row">
    <label class="span4" for="authorslist"><strong>{$LANG.CLUB_MODERATORS}</strong></label>
	<label class="span3" for="userslist"><strong>{$LANG.MY_FRIENDS_AND_CLUB_USERS}</strong></label>
</div>

<div class="controls controls-row">
	<select name="moderslist[]" size="10" multiple id="moderslist" class="span3">
		{$moders_list}
	</select>
	<div class="span1">
	<input name="moderator_add" type="button" class="btn" id="moderator_add" value="&lt;&lt;">
	<input name="moderator_remove" type="button" class="btn" id="moderator_remove" value="&gt;&gt;">
	</div>
	<select name="userslist1" size="10" multiple id="userslist1" class="span3">
		{$fr_members_list}
	</select>
</div>
</div>
	</div>
	<div class="tab-pane" id="members">
<div class="control-group">
	<label class="control-label"><strong>{$LANG.MAX_MEMBERS}:</strong></label>
	<div class="controls">
		<input name="maxsize" type="text" value="{$club.maxsize}">
		<br/><span class="muted">{$LANG.MAX_MEMBERS_TEXT}</span>
	</div>
</div>
<div class="control-group">
	<label class="control-label"><strong>{$LANG.SELECT_CLUB_TYPE}:</strong></label>
	<div class="controls">
		<select name="clubtype" id="clubtype" onchange="$('#minkarma').toggle();">
            <option value="public" {if $club.clubtype=='public'}selected="selected"{/if}>{$LANG.PUBLIC} (public)</option>
            <option value="private" {if $club.clubtype=='private'}selected="selected"{/if}>{$LANG.PRIVATE} (private)</option>
        </select>
	</div>
</div>
<div class="control-group">
	<label class="control-label"><strong>{$LANG.USE_LIMITS_KARMA}:</strong></label>
	<div class="controls">
	<label class="radio inline">
		<input name="join_karma_limit" type="radio" value="1" {if $club.join_karma_limit}checked{/if}/> {$LANG.YES}
	</label>
	<label class="radio inline">
		<input name="join_karma_limit" type="radio" value="0" {if !$club.join_karma_limit}checked{/if}/> {$LANG.NO}
	</label>
		<br/><span class="muted">{$LANG.USE_LIMITS_KARMA_TEXT}</span>
	</div>
</div>
<div class="control-group">
	<label class="control-label" ><strong>{$LANG.LIMITS_KARMA}:</strong></label>
	<div class="controls">
		&ge; <input name="join_min_karma" type="text" value="{$club.join_min_karma}"/> {$LANG.POINTS}
		<br/><span class="muted">{$LANG.LIMITS_KARMA_TEXT}</span>
        </select>
	</div>
</div>
<div id="multiuserscfg">
<div class="controls controls-row">
    <label class="span4" for="authorslist"><strong>{$LANG.CLUB_MEMBERS}</strong></label>
	<label class="span3" for="userslist"><strong>{$LANG.MY_FRIENDS_ARE}</strong></label>
</div>
<div class="controls controls-row">
	<select name="memberslist[]" size="10" multiple id="memberslist"  class="span3">
		{$members_list}
	</select>
	<div class="span1">
	<input name="member_add" type="button" class="btn" id="member_add" value="&lt;&lt;">
	<input name="member_remove" type="button" class="btn" id="member_remove" value="&gt;&gt;">
	</div>
	<select name="userslist2" size="10" multiple id="userslist2" class="span3">
		{$friends_list}
	</select>
</div>
</div>
	</div>

{if $club.enabled_photos || $club.enabled_blogs}
<div class="tab-pane" id="limits">
{if $club.enabled_blogs}
<div class="control-group">
	<label class="control-label"><strong>{$LANG.PREMODER_POSTS_IN_BLOGS}:</strong></label>
	<div class="controls">
	<label class="radio inline">
		<input name="blog_premod" type="radio" value="1" {if $club.blog_premod}checked{/if}/> {$LANG.YES}
	</label>
	<label class="radio inline">
		<input name="blog_premod" type="radio" value="0" {if !$club.blog_premod}checked{/if}/> {$LANG.NO}
	</label>	
	</div>
</div>
{/if}
{if $club.enabled_photos}
<div class="control-group">
	<label class="control-label"><strong>{$LANG.PREMODER_PHOTOS}:</strong></label>
	<div class="controls">
	<label class="radio inline">
		<input name="photo_premod" type="radio" value="1" {if $club.photo_premod}checked{/if}/> {$LANG.YES}
	</label>
	<label class="radio inline">
		<input name="photo_premod" type="radio" value="0" {if !$club.photo_premod}checked{/if}/> {$LANG.NO}
	</label>	
	</div>
</div>
{/if}
{if $club.enabled_blogs}
<div class="control-group">
	<label class="control-label">{$LANG.KARMA_LIMITS_FOR_NEW_POSTS}:</label>
	<div class="controls">
		&ge; <input name="blog_min_karma" type="text" class="span1" value="{$club.blog_min_karma}"/> {$LANG.POINTS}
	</div>
</div>
{/if}
{if $club.enabled_photos}
<div class="control-group">
	<label class="control-label">{$LANG.KARMA_LIMITS_FOR_ADD_PHOTOS}:</label>
	<div class="controls">
		&ge; <input name="photo_min_karma" type="text" class="span1" value="{$club.photo_min_karma}"/> {$LANG.POINTS}
	</div>
</div>
{/if}
{if $club.enabled_photos}
<div class="control-group">
	<label class="control-label">{$LANG.KARMA_LIMITS_NEW_PHOTOALBUM}:</label>
	<div class="controls">
		&ge; <input name="album_min_karma" type="text" class="span1" value="{$club.album_min_karma}"/> {$LANG.POINTS}
	</div>
</div>
{/if}
	</div>
{/if}
		{if $is_admin}
	<div class="tab-pane" id="vip">

        {if !$is_billing}
            <p>
                Для поддержки VIP-клубов необходим компонент &laquo;<a href="http://www.Instantcms.ru/billing/about.html">Биллинг пользователей</a>&raquo;
            </p>
            <p>
                Подключив биллинг вы сможете присвоить VIP-статус любому клубу и установить размер оплаты за вступление в этот клуб.
            </p>
        {else}
            <table width="500" border="0" cellspacing="0" cellpadding="10">
                <tr>
                    <td>
                        <label><strong>{$LANG.VIP_CLUB}:</strong></label>
                    </td>
                    <td width="150">
                        <input name="is_vip" type="radio" value="1" {if $club.is_vip}checked{/if}/> {$LANG.YES}
                        <input name="is_vip" type="radio" value="0" {if !$club.is_vip}checked{/if}/> {$LANG.NO}
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>{$LANG.VIP_CLUB_JOIN_COST}:</label>
                    </td>
                    <td width="150">
                        <input name="join_cost" type="text" style="width:60px" value="{$club.join_cost}"/> {$LANG.BILLING_POINT10}
                    </td>
                </tr>
            </table>
        {/if}
	</div>
	{/if}
</div>

<br>
<p>
	<input type="submit" class="btn" class="button" name="save" value="{$LANG.SAVE}"/>
	<input type="button" class="btn" class="button" name="back" value="{$LANG.CANCEL}" onclick="window.history.go(-1)"/>
</p>

</form>

{literal}
	<script type="text/javascript">
		$("#configtabs > ul#tabs").tabs();
		$("#club_config_form").submit(function() { 
		$('#moderslist').each(function(){
				$('#moderslist option').attr("selected","selected");
			});  
			$('#memberslist').each(function(){
				$('#memberslist option').attr("selected","selected");
			});  
		});
		$().ready(function() {  
		  $('#moderator_remove').click(function() {
		
				var user = new Array;
		
				$('#moderslist option:selected').each(function () {
					user.push(this);
				});
		
				while (user.length){
					opt     = user.pop();
					opt2    = $(opt).clone();
					$(opt).remove().appendTo('#userslist1');
					$(opt2).remove();
				}
		
		  });  
		  $('#moderator_add').click(function() {
		
				var user_id = new Array;
		
				$('#userslist1 option:selected').each(function () {
					user_id.push(this.value);
				});
		
				$('#userslist1 option:selected').remove().appendTo('#moderslist');
		
				while (user_id.length){
					id = user_id.pop();
					$('#userslist2 option[value='+id+']').remove();
				}
		
		  });  
		 
		  $('#member_remove').click(function() {
				var user = new Array;
		
				$('#memberslist option:selected').each(function () {
					user.push(this);
				});
		
				var user_id = new Array;
		
				$('#memberslist option:selected').each(function () {
					user_id.push(this.value);
				});
		
				while (user.length){
					opt     = user.pop();
					opt2    = $(opt).clone();
					$(opt).remove().appendTo('#userslist1');
					$(opt2).remove().appendTo('#userslist2');
				}
		
				while (user_id.length){
					id = user_id.pop();
					$('#moderslist option[value='+id+']').remove();
				}
		
		  });
		
		  $('#member_add').click(function() {
			  
				var user_id = new Array;
		
				$('#userslist2 option:selected').each(function () {
					user_id.push(this.value);
				});
		
				$('#userslist2 option:selected').remove().appendTo('#memberslist');       
		
		  });  
		 
		  $("#addform").submit(function() { 
				$('#moderslist').each(function(){
					$('#moderslist option').attr("selected","selected");
				});  
				$('#memberslist').each(function(){
					$('#memberslist option').attr("selected","selected");
				});  
		  });
		  
		});
	</script>
{/literal}