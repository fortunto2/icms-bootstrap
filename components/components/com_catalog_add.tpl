{* ===================== Добавление предприятия =================================== *}
<script type="text/javascript">
{if $is_admin}
{literal}
    function selectCat(){
        cat_id = $("#cat_id option:selected").val();
        window.location.href = '/catalog/'+cat_id+'/add.html';
    }
{/literal}
{/if}
    {literal}
    function showPrices(){
        var url  = "/templates/vobuhove/fulldesc.html";
        rep_win = window.open(url,"Window1", "menubar=yes,width=600,toolbar=no,location=no,scrollbars=yes");
    }
    {/literal}
</script>
<div class="con_heading">
    {if $do=='add_item'}{$LANG.ADD_ITEM}{/if}
    {if $do=='edit_item'}{$LANG.EDIT_ITEM}{/if}
</div>
<div id="configtabs">
    <div id="form">
<form id="add_form" method="post" class="form-horizontal" action="/catalog/{$cat_id}/submit.html" enctype="multipart/form-data">
<div class="control-group">
	<label class="control-label" for="title"><strong>{$LANG.TITLE}:</strong></label>
	<div class="controls">
		<input type="text" name="title" id="title" value="{$item.title|escape:'html'}">
	</div>
</div>
{if $is_admin}
<div class="control-group">
	<label class="control-label" for="cat_id"><strong>{$LANG.CAT}:</strong></label>
	<div class="controls">
		<select name="cat_id" id="cat_id" onchange="selectCat();">{$cats}</select>
	</div>
</div>
{/if}
<div class="control-group">
	<label class="control-label" for="imgfile"><strong>{$LANG.IMAGE}:</strong></label>
	<div class="controls">
		{if $do=='edit_item' && $item.imageurl}
            <div style="margin-bottom:4px;">
                <a href="/images/catalog/{$item.imageurl}" target="_blank">{$item.imageurl}</a>
            </div>
        {/if}
	<input name="imgfile" type="file" id="imgfile" size="20">
        {if $do=='edit_item' && $item.imageurl}
            <label>
                <input type="checkbox" value="1" name="delete_img" />
                {$LANG.DELETE}
            </label>
        {/if}
	</div>
</div>
{if $cat.view_type=='shop'}
<div class="control-group">
	<label class="control-label"><strong>{$LANG.PRICE}:</strong></label>
	<div class="controls">
		 <input type="text" name="price" value="{$item.price|escape:'html'}">
	</div>
</div>
<div class="control-group">
	<label class="control-label"><strong>{$LANG.CAN_MANY}:</strong></label>
	<div class="controls">
		<input type="radio" name="canmany" value="1"> {$LANG.YES}
        <input type="radio" name="canmany" value="0" checked="checked"> {$LANG.NO}
	</div>
</div>
{/if}
<div class="control-group">
	<label class="control-label" for="tags"><strong>{$LANG.TAGS}:</strong></label>
	<div class="controls">
		<input type="text" id="tags" name="tags" value="{$item.tags|escape:'html'}">
		<span class="help-block">{$LANG.KEYWORDS}</span>
	</div>
</div>
{foreach key=id item=field from=$fields}
{if $field.ftype=='link' || $field.ftype == 'text'}
<div class="control-group">
	<label class="control-label"><strong>{$field.title}:</strong></label>
	<div class="controls">
	<input name="fdata[{$id}]" type="text" id="fdata" size="" value="{if $field.value}{$field.value|escape:'html'}{/if}"/>
		{if $field.ftype=='link'} <br/><span class="help-block">{$LANG.TYPE_LINK}</span>{/if}
        {if $field.makelink} <br/><span class="help-block">{$LANG.COMMA_SEPARATE}</span>{/if}
	</div>
</div>
    {else}
	<label><strong>{$field.title}:</strong></label>
	{wysiwyg name="fdata[$id]" value=$field.value height=300 width='98%' toolbar='Basic'}	
    {/if}
{/foreach}

        {if $cfg.premod && !$is_admin}
            <p style="margin-top:15px;color:red">
                {$LANG.ITEM_PREMOD_NOTICE}
            </p>
        {/if}
        <p style="margin-top:15px">
            <input type="hidden" name="opt" value="{if $do=='add_item'}add{else}edit{/if}">
            {if $do=='edit_item'}
                <input type="hidden" id="item_id" name="item_id" value="{$item.id}">
            {/if}
            <input type="submit" class="btn" name="submit" value="{$LANG.SAVE}">
            <input type="button" class="btn" name="back" value="{$LANG.CANCEL}" onClick="window.history.go(-1)">
        </p>
</form>
    </div>
</div>
