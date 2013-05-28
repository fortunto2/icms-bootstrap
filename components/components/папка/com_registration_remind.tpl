<h1 class="con_heading">{$LANG.RECOVER_PASS}</h1>

{add_js file='components/registration/js/check.js'}
<form action="" method="post" class="form-horizontal">
    <input type="hidden" name="csrf_token" value="{csrf_token}" />
<div class="control-group">
	<label class="control-label"><strong>{$LANG.LOGIN}:</strong></label>
	<div class="controls">
		<input type="text" name="pass" value="{$user.login}" disabled="disabled" >
	</div>
</div>
<div class="control-group">
	<label class="control-label"><strong>{$LANG.PASS}:</strong></label>
	<div class="controls">
		<input type="password" name="pass" id="pass1input" value="" onchange="$('#passcheck').html('');" />
	</div>
</div>
<div class="control-group">
	<label class="control-label"><strong>{$LANG.REPEAT_PASS}:</strong></label>
	<div class="controls">
		<input type="password" name="pass2" id="pass2input" value="" onchange="checkPasswords()" />
	</div>
</div>
    <input type="submit" class="btn" id="submit" name="submit" value="{$LANG.CHANGE_PASS}" />
</form>
<script type="text/javascript">
    {literal}
        $('input[name=pass]').focus();
    {/literal}
</script>