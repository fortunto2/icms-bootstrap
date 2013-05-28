{* ================================================================================ *}
{* ======================== Фотоальбом пользователя =============================== *}
{* ================================================================================ *}
<div class="con_heading">
    <a href="{profile_url login=$usr.login}">{$usr.nickname}</a> &rarr; {$page_title}
</div>
{if ($my_profile || $is_admin) && $album_type == 'private'}
    <p>
        {if $my_profile}
            <a href="/users/addphoto.html" class="btn"><i class="icon-picture"></i> {$LANG.ADD_PHOTO}</a>
        {/if}
        <a href="javascript:void(0)" onclick="$('#usr_photos_upload_album').show();" class="btn"><i class="icon-pencil"></i> {$LANG.EDIT_ALBUM}</a>
        <a href="/users/{$user_id}/delalbum{$album.id}.html" onclick="if(!confirm('{$LANG.DELETE_ALBUM_CONFIRM}')){literal}{ return false; }{/literal}" class="btn"><i class="icon-trash"></i> {$LANG.DELETE_ALBUM}</a>
    </p>
{/if}
{if ($my_profile || $is_admin) && $album_type == 'private'}
    <div id="usr_photos_upload_album" style="display:none;">
	<form class="form-horizontal" action="/users/{$usr.id}/editalbum{$album.id}.html" method="post">
<div class="control-group">
	<label class="control-label" for="album_title">{$LANG.ALBUM_TITLE}:</label>
	<div class="controls">
		<input type="text" id="album_title" name="album_title" value="{$album.title|escape:'html'}">
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="album_allow_who">{$LANG.SHOW}:</label>
	<div class="controls">
		<select name="album_allow_who" id="album_allow_who">
            <option value="all" {if $album.allow_who=='all'}selected="selected"{/if}>{$LANG.EVERYBODY}</option>
            <option value="registered" {if $album.allow_who=='registered'}selected="selected"{/if}>{$LANG.REGISTERED}</option>
            <option value="friends" {if $album.allow_who=='friends'}selected="selected"{/if}>{$LANG.MY_FRIENDS}</option>
        </select>
	</div>
</div>
<div class="control-group">
	<label class="control-label" for="description">{$LANG.ALBUM_DESCRIPTION}:</label>
	<div class="controls">
		<textarea name="description" id="description" rows="5">{$album.description}</textarea>
	</div>
</div>
<div class="control-group">
	<div class="controls">
	<input type="submit" class="btn" name="save_album" value="{$LANG.SAVE}">
    <input name="Button" class="btn" type="button" value="{$LANG.CANCEL}" onclick="{literal}$('#usr_photos_upload_album').hide();{/literal}">
	</div>
</div>
      </form>
    </div>
{/if}
{if $album_type == 'public'}
    <div class="usr_photos_notice">{$LANG.IS_PUBLIC_ALBUM} <a href="{if !$album.NSDiffer}/photos/{$album.id}{else}/clubs/photoalbum{$album.id}{/if}">{$LANG.ALL_PUBLIC_PHOTOS}</a></div>
{/if}
{if $album_type == 'private' && $album.description}
    <div id="usr_photos_upload_album">{$album.description|nl2br}</div>
{/if}
{if $photos}

        {if ($is_admin || $my_profile) && $album_type == 'private'}
        <form action="/users/{$user_id}/photos/editlist" method="post">
            <input type="hidden" name="album_id" value="{$album.id}" />
            <script type="text/javascript">
                {literal}
                function toggleButtons(){
                    var is_sel = $('.photo_id:checked').length;
                    if (is_sel > 0) {
                        $('#edit_btn, #delete_btn').prop('disabled', false);
                    } else {
                        $('#edit_btn, #delete_btn').prop('disabled', true);
                    }
                }
                $(function() {
                    $('#sAll').click( function(){
                        if ( $(this).is('[name="all"]')) {
                            $('.photo_id').prop("checked", true);
                            $('#edit_btn, #delete_btn').prop('disabled', false);
                            $(this).text("Снять выделение").attr("name", "clear");
                        }
                        else if ( $(this).is('[name="clear"]')) {
                            $('.photo_id').prop("checked", false);
                            $('#edit_btn, #delete_btn').prop('disabled', true);
                            $(this).text("Отметить все").attr("name", "all");
                        }
                    });
                });
                {/literal}
            </script>
        {/if}
		<ul class="inline">
			{foreach key=id item=photo from=$photos}
				<li>
					<div class="usr_photo_thumb">
                        <a class="img-polaroid" data-toggle="tooltip" href="{$photo.url}" data-original-title="{$photo.title|escape:'html'}">
                            <img src="{$photo.file}" alt="{$photo.title|escape:'html'}"/>
                        </a>
						<span class="usr_photo_date">{$photo.fpubdate}</span>
                        <span class="usr_photo_hits"><strong>{$LANG.HITS}:</strong> {$photo.hits}</span>
							
                        {if ($is_admin || $my_profile) && $album_type == 'private'}
                            <input type="checkbox" name="photos[]" class="photo_id" value="{$photo.id}" onclick="toggleButtons()" />
                        {/if}
                    </div>
				</li>
			{/foreach}
		</ul>
        {if ($is_admin || $my_profile) && $album_type == 'private'}
            <div>
                <strong>{$LANG.SELECTED_ITEMS}:</strong>
                <button class="btn" type="button" id="sAll" name="all">Отметить все</button>
                <input class="btn" type="submit" name="edit" id="edit_btn" value="{$LANG.EDIT}" disabled="disabled" />
                <input class="btn" type="submit" name="delete" id="delete_btn" value="{$LANG.DELETE}" disabled="disabled" />
            </div>
            </form>
        {/if}
		{$pagebar}
{else}
    <p>{$LANG.NOT_PHOTOS}</p>
{/if}