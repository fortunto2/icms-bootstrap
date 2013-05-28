{* ================================================================================ *}
{* ========================= Просмотр фотографии ================================== *}
{* ================================================================================ *}
{strip}
<h1 class="con_heading">{$photo.title}</h1>
    <div class="row-fluid">

	{if $photo.album_nav}
            <ul class="btn-group">
                {if $previd}
				<a class="btn" href="/photos/photo{$previd.id}.html">&larr; {$LANG.PREVIOUS}</a>
                {/if}
				<a  class="btn" href="/images/photos/{$photo.file}"><i class="icon-zoom-in"></i></a>{if $previd && $nextid}{/if}{if $nextid}<a class="btn" href="/photos/photo{$nextid.id}.html">{$LANG.NEXT} &rarr;</a>
                {/if}
            </ul>
	{/if}
<div class="large-photo">
	<div class="large-photo-link">
	<img src="/images/photos/medium/{$photo.file}" border="0" alt="{$photo.title|escape:'html'}" class="span12 usr_img" id="profile-avatar">
	</div>
{if $is_author || $is_admin}	
	<div class="setting-photo">
	<a class="ajaxlink setting-profile-photo" href="javascript:void(0)" onclick="photos.editPhoto({$photo.id});return false;">
	<i class="icon-pencil"></i> {$LANG.EDIT}
	</a>
	{if $is_admin}  | 
	<a class="ajaxlink setting-profile-photo" href="javascript:void(0)" onclick="photos.movePhoto({$photo.id});return false;">
	<i class="icon-move"></i> {$LANG.MOVE}
	</a>
	{if !$photo.published}
<span id="pub_photo_link">  | 
	<a class="ajaxlink setting-profile-photo" href="javascript:void(0)" onclick="photos.publishPhoto({$photo.id});return false;">
	<i class="icon-ok-circle"></i> {$LANG.PUBLISH}
	</a>
</span>
	{/if}
	{/if}   | 
	<a class="ajaxlink setting-profile-photo" href="javascript:void(0)" onclick="photos.deletePhoto({$photo.id}, '{csrf_token}');return false;">
	<i class="icon-trash"></i> {$LANG.DELETE}		
	</a>
	</div>
	{/if}
</div>
{$photo.more}
{if $photo.description}
    <div class="photo_desc">
        {$photo.description|nl2br}
    </div>
{/if}
	<div>
        <div class="photo_details">                 
<span class="span2" id="karmapoints"><sdivong>{$LANG.RATING}: </sdivong>{$photo.rating|rating}</span> {if $photo.karma_buttons}<span>{$photo.karma_buttons}</span>{/if} <span class="span3"><sdivong>{$LANG.HITS}: </sdivong> {$photo.hits}</span>
			
                <div class="span6">
                    <span>{if !$photo.published}<span id="pub_photo_wait" style="color:#F00;">{$LANG.WAIT_MODERING}</span><span id="pub_photo_date" style="display:none;">{$photo.pubdate}</span>{else}{$photo.pubdate}{/if} </span>
                    <span>{$photo.genderlink}</span>
                </div>

                {if $cfg.link}
                    {add_js file="includes/jquery/lightbox/js/jquery.lightbox.js"}
                    {add_css file='includes/jquery/lightbox/css/jquery.lightbox.css'}
                    <p class="photo_date_details"><a class="lightbox-enabled" rel="lightbox-galery" href="/images/photos/{$photo.file}" title="{$photo.title|escape:'html'}">{$LANG.OPEN_ORIGINAL}</a></p>
                {/if}

        </div>
            {if $photo.album_nav}
                <div class="photo_sub_details">
                    {$LANG.BACK_TO} <a href="/photos/{$photo.album_id}">{$LANG.TO_ALBUM}</a><br/>
                    {$LANG.BACK_TO}  <a href="/photos">{$LANG.TO_LIST_ALBUMS}</a>
                </div>
            {/if}
            {if $photo.a_bbcode}
            <div class="photo_details" style="margin-top:5px;font-size: 12px">
                {$LANG.CODE_INPUT_TO_FORUMS}:<br/>
                <input type="text" class="photo_bbinput" value="{$bbcode}"/>
            </div>
            {/if}
			
            <div class="photo_sub_details" style="padding:0px 20px">
                {$tagbar}
            </div>
    </div>
</div>
{/strip}
