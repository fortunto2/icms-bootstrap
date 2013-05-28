{* ======================== Форма отправки инвайтов ========================= *}
<h1 class="con_heading">{$LANG.MY_INVITES}</h1>
<blockquote>
    <strong>{$LANG.YOU_CAN_SEND} {$invites_count|spellcount:$LANG.INVITE1:$LANG.INVITE2:$LANG.INVITE10} 
	<br>{$LANG.INVITE_NOTICE}</strong>
</blockquote>
<form method="post" action="">
	<div class="input-append">
        <input type="text" name="invite_email" placeholder="{$LANG.INVITE_EMAIL}" id="appendedInputButton" class="span3">
		<button type="submit" name="send_invite" class="btn">{$LANG.SEND_INVITE}</button>
    </div>
</form>

  
