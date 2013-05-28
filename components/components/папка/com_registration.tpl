{* ============== Регистрация ================== *}
<div class="con_heading">{$LANG.REGISTRATION}</div>
{if $cfg.is_on}
    {if $cfg.reg_type == 'invite' && !$correct_invite}
	<label class="text-center lead" for="appendedInputButton">{$LANG.INVITES_ONLY}</label>
	<form id="regform" name="regform" class="text-center" method="post" action="/registration">
        <div class="input-append">
            <input type="text" name="invite_code" placeholder="{$LANG.INVITE_CODE}" id="appendedInputButton" class="span3"><button type="submit" name="show_invite" class="btn">{$LANG.SHOW_INVITE}</button>
        </div>      
    </form>
    {else}
        {add_js file='components/registration/js/check.js'}
        <form id="regform" name="regform" method="post" action="/registration/add">
            <input type="hidden" name="csrf_token" value="{csrf_token}" />
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.LOGIN}:</strong>
		<br/><small>{$LANG.USED_FOR_AUTH}<br/>{$LANG.ONLY_LAT_SYMBOLS}</small>
	</div>
	<input name="login" id="logininput" type="text" value="{$item.login|escape:'html'}" onchange="checkLogin()" autocomplete="off"/>
	<span class="regstar">*</span>
	<div id="logincheck"></div>
</div>

{if $cfg.name_mode == 'nickname'}
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.NICKNAME}:</strong>
		<br/><small>{$LANG.NICKNAME_TEXT}</small>
	</div>
	<input name="nickname" id="nickinput" type="text" value="{$item.nickname|escape:'html'}" />
	<span class="regstar">*</span>
</div>	
{else}
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.NAME}:</strong>
	</div>
	<input name="realname1" id="realname1" type="text" value="{$item.realname1|escape:'html'}" />
	<span class="regstar">*</span>
</div>	
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.SURNAME}:</strong>
	</div>
	<input name="realname2" id="realname2" type="text" value="{$item.realname2|escape:'html'}" />
	<span class="regstar">*</span>
</div>	
{/if}
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.PASS}:</strong>
	</div>
	<input name="pass" id="pass1input" type="password" onchange="$('#passcheck').html('');"/>
	<span class="regstar">*</span>
</div>	
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.REPEAT_PASS}:</strong>
	</div>
    <input name="pass2" id="pass2input" type="password" onchange="checkPasswords()" />
    <span class="regstar">*</span>
    <div id="passcheck"></div>
</div>	
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.EMAIL}:</strong>
		<div><small>{$LANG.NOPUBLISH_TEXT}</small></div>
	</div>
    <input name="email" type="text" value="{$item.email}"/>
    <span class="regstar">*</span>
</div>
{if $private_forms}
    {foreach key=tid item=field from=$private_forms}
<div class="row-fluid">
	<div class="span5">
		<strong>{$field.title}:</strong>
{if $field.description}
    <div><small>{$field.description}</small></div>
{/if}
	</div>
     {$field.field} <span class="regstar">*</span>
</div>
    {/foreach}
{/if}
{if $cfg.ask_icq}
<div class="row-fluid">
	<div class="span5">
		<strong>ICQ:</strong>
	</div>
   <input name="icq" type="text" id="icq" value="{$item.icq}">
</div>	
{/if}
{if $cfg.ask_birthdate}
<div class="row-fluid">
	<div class="span5" >
		<strong>{$LANG.BIRTH}:</strong>
		<div><small>{$LANG.NOPUBLISH_TEXT}</small></div>
	</div>
	<div class="span5" style="margin-left: 0px;">
		{$dateform}
	</div>
</div>
{/if}
<div class="row-fluid">
	<div class="span5">
		<strong>{$LANG.SECUR_SPAM}:</strong>
		<div><small>{$LANG.SECUR_SPAM_TEXT}</small></div>
	</div>
   {captcha}
</div>
<input name="do" type="hidden" value="register" />
<input name="save" type="submit" class="btn" id="save" value="{$LANG.REGISTRATION}" />
        </form>
    {/if}
{else}
    <div style="margin-top:10px">{$cfg.offmsg}</div>
{/if}