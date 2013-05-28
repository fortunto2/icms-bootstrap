<form action="/login" method="post" name="authform" target="_self" id="authform">
	<div class="input-prepend">
        <span class="add-on"><i class="icon-user"></i></span><input name="login" type="text" class="input-block-level" placeholder="{$LANG.AUTH_LOGIN}">
    </div>		
	<div class="input-prepend">
        <span class="add-on"><i class="icon-cog"></i></span><input name="pass" type="password" id="pass" class="input-block-level" placeholder="{$LANG.AUTH_PASS}">
    </div>
	{if $cfg.autolog}
	<label for="remember" class="checkbox">
        <input name="remember" type="checkbox" id="remember" value="1" checked="checked">{$LANG.AUTH_REMEMBER}       
	</label>
	{/if}	
	{if $cfg.passrem}
		<a href="/passremind.html">{$LANG.AUTH_FORGOT}</a>
	{/if}
	<input class="btn" type="submit" name="Submit" value="{$LANG.AUTH_ENTER}" />
</form>