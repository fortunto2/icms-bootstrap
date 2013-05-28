{* ================================================================================ *}
{* ========================= Загрузка фото, Шаг 1 ================================= *}
{* ================================================================================ *}

<h1 class="con_heading">{$LANG.PHOTOS_CONFIG}</h1>

<script type="text/javascript">
    {literal}
    function togglePhoto(id){
        if ($('#delete'+id).attr('checked')){
            $('#photo'+id+' .text-input').attr('disabled', 'disabled');
            $('#photo'+id+' select').attr('disabled', 'disabled');
        } else {
            $('#photo'+id+' .text-input').attr('disabled', '');
            $('#photo'+id+' select').attr('disabled', '');
        }
    }
    {/literal}
</script>

<form action="" method="post" class="form-horizontal">
 {if $albums}
<div class="control-group">
	<label class="control-label" for="new_album_0"><input type="radio" name="new_album" id="new_album_0" value="0" checked="checked" onclick="$('#description').hide();">{$LANG.SAVE_TO_ALBUM}: </label>
	<div class="controls">
		<select name="album_id" class="select-input">
            {foreach key=ak item=album from=$albums}
            <option value="{$album.id}" {if $album_id == $album.id} selected="selected"{/if}>{$album.title}</option>
            {/foreach}
        </select>
	</div>
</div>
{/if}
<div class="control-group">
	<label class="control-label">
	<input type="radio" name="new_album" id="new_album_1" value="1" {if !$albums}checked="checked"{/if} onclick="$('#description').show();"> {$LANG.CREATE_NEW_ALBUM}:</label>
	<div class="controls">
		<input type="text" name="album_title" onclick="$('#description').show();$('#new_album_1').attr('checked', 'checked');">
	</div>
</div>
<div class="control-group">
	<label class="control-label">{$LANG.SHOW}:</label>
	<div class="controls">
		<select name="album_allow_who" id="album_allow_who">
            <option value="all">{$LANG.TO_ALL}</option>
            <option value="registered">{$LANG.TO_REGISTERED}</option>
            <option value="friends">{$LANG.TO_MY_FRIEND}</option>
		</select>
	</div>
</div>
<div id="description" {if $albums}style="display:none;"{/if} class="control-group">
	<label class="control-label" for="description">{$LANG.ALBUM_DESCRIPTION}:</label>
	<div class="controls">
	<textarea name="description" id="description" rows="5"></textarea>
	</div>
</div>

    <div class="usr_photos_submit_list">
        {foreach key=pk item=photo from=$photos}
        <div id="photo{$photo.id}" class="img-polaroid">
            <div class="float_bar">
                <table>
                    <tr>
                        <td width="20">
					<label class="checkbox">
						<input type="checkbox" name="delete[]" value="{$photo.id}" id="delete{$photo.id}" onclick="togglePhoto({$photo.id})">{$LANG.DELETE}
					</label></td>
                    </tr>
                </table>
            </div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="120" height="110">
                        <div class="ph_thumb"><img class="img-polaroid" src="/images/users/photos/small/{$photo.imageurl}" /></div>
                    </td>
                    <td>

                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="100" height="30">{$LANG.TITLE}:</td>
                                <td><input type="text" name="title[{$photo.id}]" value="{$photo.title|escape:'html'}" /></td>
                            </tr>
                            <tr>
                                <td height="30">{$LANG.DESCRIPTION}:</td>
                                <td><input type="text" name="desc[{$photo.id}]" value="{$photo.description|escape:'html'}" /></td>
                            </tr>
                            <tr>
                                <td height="30">{$LANG.SHOW}:</td>
                                <td>
                                    <select name="allow[{$photo.id}]">
                                        <option value="all" {if $photo.allow_who=='all'}selected="selected"{/if}>{$LANG.TO_ALL}</option>
                                        <option value="registered" {if $photo.allow_who=='registered'}selected="selected"{/if}>{$LANG.TO_REGISTERED}</option>
                                        <option value="friends" {if $photo.allow_who=='friends'}selected="selected"{/if}>{$LANG.TO_MY_FRIEND}</option>
                                    </select>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
        </div>
        {/foreach}
    </div>
    <div>
	<br>
    	<input type="hidden" name="is_edit" value="{$is_edit}">
        <input type="submit" class="btn" name="submit" value="{$LANG.SAVE}"> {$LANG.AND_GO_TO_ALBUM}
    </div>
</form>
