<h1 class="con_heading">{$LANG.REMINDER_PASS}</h1>
<form name="prform" class="text-center" action="" method="POST">
	<input type="hidden" name="csrf_token" value="{csrf_token}" />
	<label class="lead" for="writereg">{$LANG.WRITE_REGISTRATION_EMAIL}</label>
	<div class="input-append">
		<input name="email" type="text" placeholder="youremail@mail.ru" id="writereg" />
		<input name="goremind" type="submit" class="btn" value="{$LANG.SEND}"/>
	</div>
</form>
