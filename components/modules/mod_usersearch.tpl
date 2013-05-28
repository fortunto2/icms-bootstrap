<script src="/includes/jquery/autocomplete/jquery.autocomplete.min.js" type="text/javascript"></script>
<link media="screen" rel="stylesheet" href="/includes/jquery/autocomplete/jquery.autocomplete.css" type="text/css">
<form id="mod_usr_search_form" class="form-horizontal" method="post" action="/users">
<div class="control-group">
	<strong>{$LANG.FIND}</strong>
    <select name="gender" id="gender" class="input-large"">
            <option value="f">{$LANG.FIND_FEMALE}</option>
            <option value="m">{$LANG.FIND_MALE}</option>
            <option value="0" selected>{$LANG.FIND_ALL}</option>
    </select>
</div>
<div class="control-group">
		{$LANG.AGE_FROM}
    <input name="agefrom" type="text" id="agefrom" class="input-mini" placeholder="18">
        {$LANG.TO} 
	<input name="ageto" type="text" id="ageto" class="input-mini" placeholder="65">
</div>
<div class="control-group">
        {$LANG.NAME}
	<input id="name" name="name" type="text" class="input-medium">
</div>
<div class="control-group">
        {$LANG.CITY}
    <input id="city" name="city" type="text" class="input-medium">
                <script type="text/javascript">
                    {$autocomplete_js}
                </script>
</div>
<div class="control-group">
    {$LANG.HOBBY}
    <input id="hobby" name="hobby" type="text" class="input-medium">
    <button class="btn" name="gosearch" type="submit" id="gosearch">{$LANG.SEARCH}</button> 
</div>
</form>