{* ================================================================================ *}
{* ============================== Создание блога ================================== *}
{* ================================================================================ *}

<h3 class="con_heading">{$LANG.CREATE_BLOG}</h3>
<blockquote>
<p><strong>{$LANG.BLOG}</strong> {$LANG.BLOG_DESCRIPTION}</p>
</blockquote>

<form action="" method="post" name="addform" class="form-horizontal">
<div class="well">
	<div class="control-group">
        <label for="title" class="control-label"><strong>{$LANG.BLOG_TITLE}:</strong></label>
        <div class="controls">
			<input name="title" type="text" id="title" size="40">
        </div>
    </div>

	<div class="control-group">
        <label for="ownertype" class="control-label"><strong>{$LANG.BLOG_TYPE}:</strong></label>
        <div class="controls">
			<select name="ownertype" id="ownertype">
			  <option value="single" selected>{$LANG.PERSONAL} {if $is_restrictions && $cfg.min_karma_private>0}({$LANG.BLOG_KARMA_NEED} {$cfg.min_karma_private}){/if}</option>
			  <option value="multi" >{$LANG.COLLECTIVE} {if $is_restrictions && $cfg.min_karma_public>0}({$LANG.BLOG_KARMA_NEED} {$cfg.min_karma_public}){/if}</option>
		  </select>
        </div>
    </div>

	<div class="control-group">
        <label for="allow_who" class="control-label"><strong>{$LANG.SHOW_BLOG}:</strong></label>
        <div class="controls">
			<select name="allow_who" id="allow_who">
			<option value="all" selected="selected">{$LANG.TO_ALL}</option>
			<option value="friends">{$LANG.TO_MY_FRIENDS}</option>
			<option value="nobody">{$LANG.TO_ONLY_ME}</option>
		</select>
        </div>
    </div>
</div>
<p>
  	<input name="goadd" type="submit" class="btn" id="goadd" value="{$LANG.CREATE_BLOG}" />
  	<input name="cancel" type="button" class="btn" onclick="window.history.go(-1)" value="{$LANG.CANCEL}" />
</p>
</form>
{literal}
<script type="text/javascript">
    $(document).ready(function(){
        $('#title').focus();
    });
</script>
{/literal}