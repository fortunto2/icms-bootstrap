<form action="/forum/renamethread{$thread.id}.html" method="POST" class="form-horizontal" id="renamethread_form">
	<input type="hidden" name="gorename" value="1" />
<div class="control-group">
	<label class="control-label">{$LANG.THREAD_TITLE}:</label>
	<div class="controls">
		<input type="text" value="{$thread.title|escape:html}" name="title" id="title">
	</div>
</div>
<div class="control-group">
	<label class="control-label">{$LANG.DESCRIPTION}:</label>
	<div class="controls">
		<input type="text" value="{$thread.description|escape:html}" name="description">
	</div>
</div>
</form>
<script type="text/javascript" src="/includes/jquery/jquery.form.js"></script>
{literal}
    <script type="text/javascript">
        $(document).ready(function(){
            $('#title').focus();
        });
    </script>
{/literal}