<form id="search_form"action="/index.php" method="GET" enctype="multipart/form-data" style="clear:both">
<div class="input-append">
	<input type="hidden" name="view" value="search" />
	<input type="text" name="query" id="query" class="span2" value="" placeholder="{$LANG.SEARCH_ON_SITE}"><div class="btn-group">
	<a href="javascript:" onclick="$('#from_search').fadeIn('slow');" class="ajaxlink btn dropdown-toggle"><i class="bac-settings"></i></a>
    <ul class="dropdown-menu" id="from_search">
    <strong>{$LANG.WHERE_TO_FIND}:</strong>
		
		{foreach key=tid item=enable_component from=$enable_components}
	<li>
            <label id="l_{$enable_component.link}" class="selected">
            <input name="from_component[]" onclick="toggleInput('l_{$enable_component.link}')" type="checkbox" value="{$enable_component.link}" checked="checked" /> 
            {$enable_component.title}</label>
	</li>{/foreach}
	<li class="divider"></li>
		<select name="look" onchange="$('#search_form').submit();	">
            <option value="allwords" selected="selected">{$LANG.ALL_WORDS}</option>
            <option value="anyword" >{$LANG.ANY_WORD}</option>
            <option value="phrase" >{$LANG.PHRASE}</option>
		</select>
	<li class="divider"></li>
        <p><strong>{$LANG.PUBDATE}:</strong></p>
        <select name="from_pubdate">
          <option value="" selected="selected">{$LANG.ALL}</option>
          <option value="d" >{$LANG.F_D}</option>
          <option value="w" >{$LANG.F_W}</option>
          <option value="m" >{$LANG.F_M}</option>
          <option value="y" >{$LANG.F_Y}</option>
        </select>
        <label id="order_by_date" class="selected">
                	<input name="order_by_date" onclick="toggleInput('order_by_date')" type="checkbox" value="1" checked="checked" /> 
                    {$LANG.SORT_BY_PUBDATE}
		</label>
        <div style="position:absolute; top:0; right:10px; font-size:10px;">
        	<a href="javascript:" onclick="$('#from_search').fadeOut();" class="ajaxlink">{$LANG.HIDE}</a>
        </div>
        <div style="position:absolute; top:0; leftt:10px; font-size:10px;">
        	<a href="javascript:" onclick="$('#search_form input[type=checkbox]').attr('checked', 'checked');$('#from_search label').addClass('selected');" class="ajaxlink">{$LANG.SELECT_ALL}</a> | 
			<a href="javascript:" onclick="$('#search_form input[type=checkbox]').attr('checked', '');$('#from_search label').removeClass('selected');" class="ajaxlink">{$LANG.REMOVE_ALL}</a>
        </div>
    </ul>
</div><input type="submit" class="btn" style="height: 30px;" value="{$LANG.FIND}"/>
</div>
</form>
{literal}
<script type="text/javascript">
		function toggleInput(id){
			$('#from_search label#'+id).toggleClass('selected');
		}
</script>
{/literal}