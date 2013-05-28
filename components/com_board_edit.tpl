<h1 class="con_heading">{$pagetitle}</h1>
<form action="{$action}" method="post" class="form-horizontal" enctype="multipart/form-data">
<div class="control-group">
	<label class="control-label" for="category_id"><strong>{$LANG.CAT_BOARD}:</strong></label>
	<div class="controls">
		<select name="category_id" id="category_id" onchange="getRubric();">
            <option value="0">-- {$LANG.SELECT_CAT} --</option>
            {$catslist}
        </select>
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="title"><strong>{$LANG.TITLE}:</strong></label>
	<div class="controls">
		<select name="obtype" id="obtype" class="span2">
			<option value="0">-- {$LANG.SELECT_CAT} --</option>
		</select>
		<input name="title" type="text" id="title" maxlength="250"  value="{$item.title|escape:'html'}"/>
	</div>
</div>
<div class="control-group" id="from_search">
	<div class="controls">
	<input name="title_fake" type="text" id="title_fake" maxlength="250"  value=""/>
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="city_ed"><strong>{$LANG.CITY}:</strong></label>
	<div class="controls">
		<input name="city_ed" class="span2" type="text" id="city_ed" value="{$item.city|escape:'html'}"/> {$LANG.OR_SELECTING} {$cities}
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="content"><strong>{$LANG.TEXT_ADV}:</strong></label>
	<div class="controls">
		<textarea name="content" class="span5" rows="5" id="content">{$item.content|escape:'html'}</textarea>
	</div>
</div>
{if $formsdata}
    {foreach key=tid item=form from=$formsdata}
<div class="control-group">
	<label class="control-label"><strong>{$form.title}:</strong></label>
	<div class="controls">
	    {if $form.description}
            <div style="color:gray">{$form.description}</div>
        {/if}
		{$form.field}
	</div>
</div>
    {/foreach}
{/if}

{if $cfg.photos && $cat.is_photos}
<div class="control-group">
	<label class="control-label" for="picture"><strong>{$LANG.PHOTO}:</strong></label>
	<div class="controls">
		<input name="Filedata" type="file" id="picture" style="width:407px;" />
	</div>
</div>
{/if}

{if $form_do == 'edit'}
<div class="control-group">
	<label class="control-label"><strong>{$LANG.PERIOD_PUBL}:</strong></label>
	<div class="controls">
		{$item.pubdays} {$LANG.DAYS}, {$LANG.DAYS_TO} {$item.pubdate}.
	</div>
</div>
{elseif $cfg.srok}
<div class="control-group">
	<label class="control-label" for="pubdays"><strong>{$LANG.PERIOD_PUBL}:</strong></label>
	<div class="controls">
		<select name="pubdays" id="pubdays">
			<option value="5">5</option>
			<option value="10" selected="selected">10</option>
			<option value="14">14</option>
			<option value="30">30</option>
			<option value="50">50</option>
		</select> {$LANG.DAYS}
	</div>
</div>			
{/if}
{if $cfg.extend && $form_do == 'edit' && !$item.published && $item.is_overdue}
    {if $cfg.srok}
<div class="control-group">
	<label class="control-label" for="pubdays"><strong>{$LANG.ADV_EXTEND}:</strong></label>
	<div class="controls">
		<select name="pubdays" id="pubdays">
            <option value="5">5</option>
            <option value="10" selected="selected">10</option>
            <option value="14">14</option>
            <option value="30">30</option>
            <option value="50">50</option>
        </select>  {$LANG.DAYS}
	</div>
</div>
    {else}
<div class="control-group">
	<label class="control-label" for="title"><strong>{$LANG.ADV_EXTEND}:</strong></label>
	<div class="controls">
		{$LANG.ADV_EXTEND_SROK} {$item.pubdays} {$LANG.DAYS}
	</div>
</div>
    {/if}
{/if}

{if $form_do == 'edit' && $item.is_vip}
<div class="control-group">
	<label class="control-label"><strong>{$LANG.VIP_STATUS}:</strong></label>
	<div class="controls">
		до {$item.vipdate}
	</div>
</div>
{/if}

		{if $is_admin || ($is_billing && $cfg.vip_enabled && ($form_do=='add' || ($form_do=='edit' && $cfg.vip_prolong)))}
			<div class="control-group">
			<label class="control-label" for="vipdays"><strong>{if $form_do=='add' || !$item.is_vip}{$LANG.MARK_AS_VIP}{else}{$LANG.EXTEND_MARK_AS_VIP}{/if}:</strong></label>	
				<div class="controls">
                    <select id="vipdays" name="vipdays" {if !$is_admin}onchange="calculateVip()"{/if}>
                        <option value="0">{if $form_do=='add' || !$item.is_vip}{$LANG.DO_NOT_DO}{else}{$LANG.LEAVE_AS_IS}{/if}</option>
                        {if $form_do=='edit' && $item.is_vip}
                            <option value="-1">{$LANG.DELETE_MARK_AS_VIP}</option>
                        {/if}
                        {section name=vipdays start=1 loop=$cfg.vip_max_days+1 step=1}
                            <option value="{$smarty.section.vipdays.index}">
                                {$smarty.section.vipdays.index|spellcount:$LANG.DAY1:$LANG.DAY2:$LANG.DAY10}
                            </option>
                        {/section}
                    </select>

                    {if !$is_admin}
                        <input type="hidden" id="vip_day_cost" name="vip_day_cost" value="{$cfg.vip_day_cost}" />
                        <input type="hidden" id="balance" name="balance" value="{$balance}" />
                        <div id="vip_cost" style="margin-top:10px;display: none">
                            {$LANG.BILLING_COST}: <span>0</span> {$LANG.BILLING_POINT10}
                        </div>
                        <script type="text/javascript">
                            {literal}
                                function calculateVip(){

                                    var days = $('#vipdays').val();
                                    var cost = $('#vip_day_cost').val();

                                    if (Number(days)==0){
                                        $('#vip_cost').hide().find('span').html('0');
                                    } else {
                                        var summ = days * cost;
                                        $('#vip_cost').show().find('span').html(summ);
                                    }

                                }

                                function checkBalance(){
                                    var cost    = Number($('#vip_cost span').html());
                                    var balance = Number($('#balance').val());

                                    if (balance < cost){
                                        core.alert('На вашем балансе не достаточно средств\nдля покупки VIP-статуса на указанный срок', 'Ошибка');
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }
                            {/literal}
                        </script>
                    {/if}
					<div class="muted">
                        VIP-объявления выделяются цветом и всегда находятся в начале списка
                    </div>
				</div>
			</div>
		{/if}
{if !$is_user}
<div class="control-group">
	<label class="control-label" for="title"><strong>{$LANG.SECUR_SPAM}:</strong></label>
	<div class="controls">
	{captcha} <small>{$LANG.SECUR_SPAM_TEXT}</small>
	</div>
</div>
{/if}
<div class="control-group">
	<div class="controls">
	<input name="submit" type="submit" class="btn" id="submit" value="{$LANG.SAVE_ADV}" {if $is_admin || ($is_billing && $cfg.vip_enabled)}onclick="if(!checkBalance())return false;"{/if} />
	</div>
</div>
</form>
{literal}
<script type="text/javascript">
	function getRubric(){
		$("#category_id").attr("disabled", "");
		$("#obtype").attr("disabled", "disabled");
		var category_id = $('select[name=category_id]').val();
		if(category_id != 0){
			$.post("/components/board/ajax/get_rubric.php", {value: category_id, obtype: '{/literal}{$item.obtype}{literal}'}, function(data) {
				$("#obtype").attr("disabled", "");
				$("#obtype").html(data);
			});
			{/literal}
			{if $form_do == 'add'}
			{literal}
			$.post("/components/board/ajax/get_form.php", {value: category_id}, function(dataform) {
				if(dataform!=1){
					$('.cat_form').remove();
					$("#before_form").after(dataform);
				}else{
					$('.cat_form').remove();
				}
			});
			{/literal}
			{/if}
			{literal}
		} else {
			$("#obtype").html('<option value="0">-- {/literal}{$LANG.SELECT_CAT}{literal} --</option>');
			$("#obtype").attr("disabled", "disabled");
			$('.cat_form').remove();
		}
	}
	$(document).ready(function() {
		$('#title').focus();
		$('#from_search').hide();
		getRubric();
	});
</script>
{/literal}