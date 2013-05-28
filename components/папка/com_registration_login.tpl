{* ================================================================================ *}
{* ============================ Форма авторизации ================================= *}
{* ================================================================================ *}
<h1 class="con_heading">{$LANG.SITE_LOGIN}</h1>
{if $is_sess_back}
<label for="login_field">{$LANG.PAGE_ACCESS_NOTICE}</label>
{/if}
<div class="login_form">
    <form method="post" action="">
		<div class="input-prepend">
            <span class="add-on"><i class="icon-user"></i></span><input type="text" name="login" id="login_field" tabindex="1" placeholder="{$LANG.LOGIN} {$LANG.OR} {$LANG.EMAIL}">
        </div>
		<div class="input-prepend">
			<span class="add-on"><i class="icon-cog"></i></span><input type="password" name="pass" id="pass_field" tabindex="2" placeholder="{$LANG.PASS}">
        </div>
		</br>			
    {if $anti_brute_force}
		<div class="captcha">
            <div class="lf_title">{$LANG.SECUR_SPAM}</div>
                <div class="lf_field">
                    {captcha}
                </div>
		</div>
	</br>
    {/if}
<div>
	<p>
		<a href="/passremind.html" title="Нажмите чтобы восстановить ваш пароль">{$LANG.FORGOT_PASS}</a> 
		<a href="/registration">{$LANG.REGISTRATION}</a>
	</p>
	<label for="remember" class="checkbox">
        <input type="checkbox" name="remember" value="1" checked="checked" id="remember" tabindex="3"> {$LANG.REMEMBER_ME}
    </label>
    <p class="lf_submit">
        <input type="submit" class="btn" name="login_btn" value="{$LANG.SITE_LOGIN_SUBMIT}" tabindex="4" />
    </p>
</div>
    </form>
    <div>
        {php}cmsCore::callEvent('LOGINZA_BUTTON', array());{/php}
    </div>
</div>
<script type="text/javascript">
    {literal}
    $(document).ready(function(){
        $('.login_form #login_field').focus();
    });
    {/literal}
</script>