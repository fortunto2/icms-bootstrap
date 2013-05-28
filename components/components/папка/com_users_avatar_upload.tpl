{* ==================== Загрузка ававтара ========================================= *}
<script type="text/javascript" src="/templates/bootstrap_2_3_1//js/bootstrap-uploader.js"></script>
<div class="con_heading">{$LANG.LOAD_AVATAR}</div>
<blockquote>
	<p>{$LANG.SELECT_UPLOAD_FILE}:</p>
	<a href="/users/{$id}/select-avatar.html"><i class="icon-picture"></i> {$LANG.SELECT_AVATAR_FROM_COLL}</a>
</blockquote>
<form enctype="multipart/form-data" action="/users/{$id}/avatar.html" method="POST">
		<input name="upload" type="hidden" value="1"/>
		<input name="userid" type="hidden" value="{$id}"/>
		<input name="picture" type="file" id="picture" size="30" data-button-text="Обзор">
	<p>
		<input type="submit" class="btn" value="{$LANG.UPLOAD}"> 
		<input type="button" class="btn" onclick="window.history.go(-1);" value="{$LANG.CANCEL}"/>
	</p>
</form>