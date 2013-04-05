{if !$is_ajax}
<div id="poll_module_{$module_id}">{/if}
{if !$is_voted}
    <p class="mod_poll_title"><strong>{$poll.title}</strong></p>
    <form action="/polls/vote" method="post" id="mod_poll_submit_form">
    <input type="hidden" name="poll_id" value="{$poll.id}">
    <input type="hidden" name="module_id" value="{$module_id}">
    <input type="hidden" name="csrf_token" value="{csrf_token}">
    {foreach key=answer item=num from=$poll.answers}
  	<label class="radio">
            <input type="radio" name="answer" id="optionsRadios1" value="{$answer|escape:'html'}"> {$answer}{if $cfg.shownum} ({$num}){/if}
        </label>
    {/foreach}
	<div align="center">
		<input type="button" id="mod_poll_submit" class="mod_poll_submit btn" onclick="pollSubmit();" value="{$LANG.POLLS_VOTE} {if $cfg.shownum}({$poll.total_answers}){/if}">
	</div>
    </form>
{else}
    <p class="mod_poll_title"><strong>{$poll.title}</strong></p>
    {foreach key=answer item=num from=$poll.answers}
        {assign var="percent" value="`$num/$poll.total_answers*100`"}
        <span class="mod_poll_gauge_title">{$answer} ({$num})</span>
        {if $percent > 0}
        <div class="progress">
 		<div class="bar" style="width: {$percent|ceil}%;"></div>
	</div>
        {else}
	<div class="progress">
		<div class="bar" style="width: 1px;"></div>
	</div>
        {/if}
    {/foreach}
{/if}
{if !$is_ajax}
</div>
<script type="text/javascript" src="/includes/jquery/jquery.form.js"></script>
{literal}
<script type="text/javascript">
function pollSubmit(){
    $('#mod_poll_submit').attr('disabled', 'disabled');
    var options = {
        success: loadPoll
    };
    $('#mod_poll_submit_form').ajaxSubmit(options);
}
function loadPoll(result, statusText, xhr, $form){
    var module_id = {/literal}{$module_id}{literal};
	if(statusText == 'success'){
		if(result.error == false){
            core.alert(result.text, 'Уведомление!');
            $.post('/modules/mod_polls/load.php', {module_id: module_id, is_ajax: 1}, function(data){
                $('#poll_module_'+module_id).html(data);
            });
            setTimeout('core.box_close()', 900);
		} else {
            core.alert(result.text, 'Внимание!');
            $('#mod_poll_submit').attr('disabled', '');
        }
	}
}
</script>
{/literal}
{/if}
