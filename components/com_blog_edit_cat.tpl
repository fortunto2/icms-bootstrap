<form action="{$form_action}" method="post" name="addform" class="form-horizontal"id="addform">
    <input type="hidden" name="goadd" value="1" />
    <input type="hidden" name="csrf_token" value="{csrf_token}" />
	<div class="control-group">
        <label for="title" class="control-label"><strong>{$LANG.CAT_NAME}:</strong></label>
        <div class="controls">
			<input name="title" type="text" id="title" value="{$mod.title|escape:'html'}">
        </div>
    </div>
	<div class="control-group">
        <label for="descr" class="control-label"><strong>{$LANG.CAT_DESCRIPTION}:</strong></label>
        <div class="controls">
			<textarea name="description" id="descr" cols="1" rows="10" >{$mod.description|escape:'html'}</textarea>
        </div>
    </div>
</form>
<script type="text/javascript" src="/includes/jquery/jquery.form.js"></script>
{literal}
<script type="text/javascript">
    $(document).ready(function(){
        $('#title').focus();
    });
</script>
{/literal}
<div class="sess_messages" style="display:none">
  <div class="message_info" id="error_mess"></div>
</div>