{* ====================== Форма добавления вопроса FAQ ============================ *}
<div class="con_heading">{$LANG.SET_QUESTION}</div>
<blockquote>
{$LANG.SET_QUESTION_TEXT} <br>
{$LANG.CONTACTS_TEXT}
</blockquote>
{if $error}<p class="text-error">{$error}</p>{/if}
<form action="" method="POST" name="questform" class="form-horizontal">
<div class="control-group">
	<label class="control-label"><strong>{$LANG.CAT_QUESTIONS}:</strong></label>
	<div class="controls">
		<select name="category_id">
			{$catslist}
		</select>
	</div>
</div>
<div class="control-group">
	<textarea name="message" id="faq_message" class="input-xxlarge" rows="5">{$message}</textarea>
</div>
    {if !$user_id}
        <p>{captcha}</p> 
    {/if}
	<input type="button" class="btn" onclick="sendQuestion()" name="gosend" value="{$LANG.SEND}"/>
	<input type="button" class="btn" name="cancel" onclick="window.history.go(-1)" value="{$LANG.CANCEL}"/>
</form>
