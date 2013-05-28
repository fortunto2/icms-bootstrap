{* ================================================================================ *}
{* ============================= Настройка блога ================================== *}
{* ================================================================================ *}
<form action="{$form_action}" method="post" class="form-horizontal" name="cfgform" id="cfgform">
<div class="control-group">
	<label class="control-label" for="blogTitle">{$LANG.BLOG_TITLE}:</label>
	<div class="controls">
		<input name="title" type="text" id="blogTitle" value="{$blog.title|escape:'html'}">
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="showblog">{$LANG.SHOW_BLOG}:</label>
	<div class="controls">
		<select name="allow_who" id="showblog">
				<option value="all" selected="selected" {if ($blog.allow_who == 'all')} selected {/if}>{$LANG.TO_ALL}</option>
				<option value="friends" {if ($blog.allow_who == 'friends')} selected {/if}>{$LANG.TO_MY_FRIENDS}</option>
				<option value="nobody" {if ($blog.allow_who == 'nobody')} selected {/if}>{$LANG.TO_ONLY_ME}</option>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="showTag">{$LANG.SHOW_CAT}</label>
	<div class="controls">
		<select name="showcats" id="showTag">
			<option value="1" selected="selected" {if ($blog.showcats == 1)} selected {/if}>{$LANG.YES}</option>
			<option value="0" {if ($blog.showcats == 0)} selected {/if}>{$LANG.NO}</option>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="blogType">{$LANG.BLOG_TYPE}</label>
	<div class="controls">
		<select name="ownertype" id="blogType" onchange="selectOwnerType()">
			<option value="single" {if ($blog.ownertype == 'single')} selected {/if}>{$LANG.PERSONAL} {if $is_restrictions && $cfg.min_karma_private>0}({$LANG.BLOG_KARMA_NEED} {$cfg.min_karma_private}){/if}</option>
			<option value="multi" {if ($blog.ownertype == 'multi')} selected {/if}>{$LANG.COLLECTIVE} {if $is_restrictions && $cfg.min_karma_public>0}({$LANG.BLOG_KARMA_NEED} {$cfg.min_karma_public}){/if}</option>
		</select>
	</div>
</div>
  
<div id="multiblogcfg" style="display:{if $blog.ownertype=='single'}none;{else}block;{/if}">
<div class="control-group">
	<label class="control-label" for="premod">{$LANG.PREMODER_POST}</label>
	<div class="controls">
		<select name="premod" id="premod">
			  <option value="1" {if ($blog.premod == 1)} selected {/if}>{$LANG.ON}</option>
			  <option value="0" {if ($blog.premod == 0)} selected {/if}>{$LANG.OFF}</option>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="forall">{$LANG.WHO_CAN_WRITE_TO_BLOG}</label>
	<div class="controls">
		<select name="forall" id="forall" onchange="selectAuthorsType()">
			  <option value="1" {if ($blog.forall == 1)} selected {/if}>{$LANG.ALL_USERS}</option>
			  <option value="0" {if ($blog.forall == 0)} selected {/if}>{$LANG.LIST_USERS}</option>
		</select>
	</div>
</div>
</div>
  
<div id="multiuserscfg" style="margin:5px 0 5px -180px;display: {if $blog.ownertype=='single' || $blog.forall}none;{else}table;{/if}">
 
<div class="controls controls-row">
    <label class="span3" for="authorslist">{$LANG.CAN_WRITE_TO_BLOG}</label>
	<label class="span3" for="userslist">{$LANG.ALL_USERS}</label>
</div>

<div class="controls controls-row">
	<select name="authorslist[]" size="15" class="span3" multiple id="authorslist">
			{$authors_list}
	</select>
	<div class="span1">
	<input name="author_add" type="button" class="btn" id="author_add" value="&lt;&lt;">
	<input name="author_remove" type="button" class="btn" id="author_remove" value="&gt;&gt;">
	</div>

	<select name="userslist" size="15" multiple class="span3" id="userslist">
			{$users_list}
	</select>
</div>

</div>

    <input type="hidden" name="goadd" value="1" />
    <input type="hidden" name="csrf_token" id="csrf_token" value="{csrf_token}" />
</form>
<div class="sess_messages" style="display:none">
  <div class="message_info" id="error_mess"></div>
</div>
<script type="text/javascript" src="/includes/jquery/jquery.form.js"></script>
{literal}
	<script type="text/javascript">
		$().ready(function() {  
		  $('#author_remove').click(function() {  
				return !$('#authorslist option:selected').remove().appendTo('#userslist');  
		  });  
		  $('#author_add').click(function() {  
				return !$('#userslist option:selected').remove().appendTo('#authorslist');  
		  });  
		  
		});  
		function selectOwnerType(){
			var ot = $('#ownertype').attr('value');
			if (ot == 'multi') {
				$('#multiblogcfg').show();
				if ($('#forall').attr('value')==0){
					$('#multiuserscfg').show();
				}
			} else {
				$('#multiblogcfg').hide();
				$('#multiuserscfg').hide();
			}
		}
		function selectAuthorsType(){
			var ot = $('#forall').attr('value');
			if (ot == '0') {
				$('#multiuserscfg').show();
			} else {
				$('#multiuserscfg').hide();
			}
		}
	</script>
{/literal}