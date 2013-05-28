{* ================================================================================ *}
{* ==================== Форма сортировки на доске объявлений ====================== *}
{* ================================================================================ *}

<form action="{$action_url}" method="POST" id="obform" class="form-inline">
	<div class="photo_sortform">
<div class="input-prepend">
	<span class="btn">{$LANG.TYPE}</span>
	<select name="obtype" class="input-medium" id="obtype" onchange="$('form#obform').submit();">
	<option value="all" {if (empty($btype))} selected {/if}>{$LANG.ALL_TYPE}</option>
						{$btypes}
	</select>
</div>
<div class="input-prepend">
	<span class="btn">{$LANG.CITY}</span>
	{$bcities}
</div>
<p></p>
<div class="input-prepend input-append">
	<span class="btn">{$LANG.ORDER}:</span>
	<select name="orderby" class="input-small" id="orderby">
		<option value="title" {if $orderby=='title'} selected {/if}>{$LANG.ORDERBY_TITLE}</option>
		<option value="pubdate" {if $orderby=='pubdate'} selected {/if}>{$LANG.ORDERBY_DATE}</option>
		<option value="hits" {if $orderby=='hits'} selected {/if}>{$LANG.ORDERBY_HITS}</option>
		<option value="obtype" {if $orderby=='obtype'} selected {/if}>{$LANG.ORDERBY_TYPE}</option>
		<option value="user_id" {if $orderby=='user_id'} selected {/if}>{$LANG.ORDERBY_AVTOR}</option>
	</select>
	<select name="orderto" class="input-medium" id="orderto">';
		<option value="desc" {if $orderto=='desc'} selected {/if}>{$LANG.ORDERBY_DESC}</option>
		<option value="asc" {if $orderto=='asc'} selected {/if}>{$LANG.ORDERBY_ASC}</option>
	</select>
</div>
	<input type="submit" class="btn" value="{$LANG.FILTER}">
	</div>
</form>