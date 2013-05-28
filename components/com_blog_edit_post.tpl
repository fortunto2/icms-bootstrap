<h3 class="con_heading">{$pagetitle}</h3>
<form action="" method="post" name="msgform" enctype="multipart/form-data" class="form-horizontal">
<div class="control-group">
	<label class="control-label" for="title"><strong>{$LANG.TITLE_POST}:</strong></label>
	<div class="controls">
		<input name="title" type="text" id="title" class="span4" value="{$mod.title|escape:'html'}">
	</div>
</div>
{if $blog.showcats && $cat_list}
<div class="control-group">
	<label class="control-label" for="cat_id"><strong>{$LANG.BLOG_CAT}:</strong></label>
	<div class="controls">
		<select name="cat_id" class="span4" id="cat_id">
			<option value="0" {if !isset($mod.cat_id) || $mod.cat_id==0}  selected {/if}>{$LANG.WITHOUT_CAT}</option>
			{$cat_list}
		</select>
	</div>
</div>		
{/if}
<div class="control-group">
	{if $myblog || $is_admin}
	<label class="control-label" for="allow_who"><strong>{$LANG.SHOW_POST}:</strong></label>
	<div class="controls">
		<select name="allow_who" id="allow_who" class="span4" >
			<option value="all" {if !isset($mod.allow_who) || $mod.allow_who=='all'} selected {/if}>{$LANG.TO_ALL}</option>
			<option value="friends" {if $mod.allow_who=='friends'} selected {/if}>{$LANG.TO_MY_FRIENDS}</option>
			<option value="nobody" {if $mod.allow_who=='nobody'} selected {/if}>{$LANG.TO_ONLY_ME}</option>
		</select>
	</div>
	{else}
		<input type="hidden" name="allow_who" class="span4" value="{$blog.allow_who}">
	{/if}
</div>
<div class="control-group">
	<label class="control-label" for="feel"><strong>{$LANG.YOUR_MOOD}:</strong></label>
	<div class="controls">
		<input name="feel" class="span4" type="text" id="feel" value="{$mod.feel|escape:'html'}">
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="music"><strong>{$LANG.PLAY_MUSIC}:</strong></label>
	<div class="controls">
		<input name="music" type="text" class="span4" id="music" value="{$mod.music|escape:'html'}">
	</div>
</div>
{if $is_admin || $user_can_iscomments}
<div class="control-group">
	<label class="control-label" for="comments"><strong>{$LANG.COMMENTS}:</strong></label>
	<div class="controls">
		<select name="comments" id="comments" class="span4">
            <option value="0" {if !$mod.comments}selected="selected"{/if}>{$LANG.NO}</option>
            <option value="1" {if $mod.comments}selected="selected"{/if} >{$LANG.YES}</option>
        </select><br />
        <span class="hinttext" style="font-size:11px">{$LANG.IS_COMMENTS}</span>
	</div>
</div>
{/if}		
<div class="control-group">
	<label class="control-label" for="tags"><strong>{$LANG.TAGS}:</strong></label>
	<div class="controls">
		<input name="tags" type="text" class="span4" id="tags" value="{$mod.tags|escape:'html'}"/><br />
		<span class="hinttext" style="font-size:11px">{$LANG.KEYWORDS}</span>
		<script type="text/javascript">{$autocomplete_js}</script>		
	</div>
</div>
<div class="usr_msg_bbcodebox">{$bb_toolbar}</div>
{$smilies}
{$autogrow}
<div class="cm_editor">
<textarea class="ajax_autogrowarea" name="content" id="message">{$mod.content|escape:'html'}</textarea>
</div>
    <br />
	<blockquote>
        <strong>{$LANG.IMPORTANT}:</strong> {$LANG.CUT_TEXT},<br/>
        <a href="javascript:addTagCut('message');" class="ajaxlink">{$LANG.ADD_CUT_TAG}</a> {$LANG.BETWEEN}.
    </blockquote>
	<p>
		<input name="goadd" type="submit" class="btn" id="goadd" value="{$LANG.SAVE_POST}" />
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