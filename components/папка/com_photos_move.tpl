<form action="{$form_action}" method="POST" class="form-inline" id="move_photo_form">
	<input type="hidden" value="1" name="move_photo" />
	<strong>{$LANG.MOVE_INTO_ALBUM}:</strong>
	<select name="album_id">{$html}</select>
</form>
<script type="text/javascript" src="/includes/jquery/jquery.form.js"></script>