<form action="/forum/movepost.html" method="POST" class="form-inline" id="movethread_form">
    <input type="hidden" name="gomove" value="1" />
    <input type="hidden" name="id" value="{$thread.id}" />
    <input type="hidden" name="post_id" value="{$post_id}" />
<label class="control-label">{$LANG.MOVE_POST}:</label>
<select name="new_thread_id">
	{$threads}
</select>
</form>