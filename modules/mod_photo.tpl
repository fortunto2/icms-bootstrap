<div class="row">
{foreach key=tid item=photo from=$photos}
    <div class="mod-photo">
		<a href="/{if $photo.NSDiffer != ''}clubs{else}photos{/if}/photo{$photo.id}.html" title="{$photo.title|escape:'html'}">
            <img class="img-polaroid" src="/images/photos/small/{$photo.file}" alt="{$photo.title|escape:'html'}">
        </a>
    {if $cfg.is_full}
            <br />
		<a href="/{if $photo.NSDiffer != ''}clubs{else}photos{/if}/photo{$photo.id}.html" title="{$photo.title|escape:'html'}">
			{$photo.title|truncate:18}
		</a>
        <div class="mod_lp_albumlink">
			<a href="/{if $photo.NSDiffer != ''}clubs/photoalbum{else}photos/{/if}{$photo.album_id}" title="{$photo.cat_title|escape:'html'}">{$photo.cat_title|truncate:18}</a>
                <div class="mod_lp_details">
                <table cellpadding="2" cellspacing="0" align="center" border="0"><tr>
                    <td><i class="icon-calendar"></i></td>
                    <td>{$photo.pubdate}</td>
                    <td><i class="icon-comment"></i></td>
                    <td><a href="/photos/photo{$photo.id}.html#c" title="{$photo.comments|spellcount:$LANG.COMMENT1:$LANG.COMMENT2:$LANG.COMMENT10}">{$photo.comments}</a></td>
                    <td><i class="icon-star-empty"></i></td>
                    <td>{$photo.rating|rating}</td>
                </tr></table>
                </div>
		</div>
    {/if}
	</div>
{/foreach}
</div>
{if $cfg.showmore}
<div class="btn btn-small">
	{if $cfg.sort == 'pubdate'}
    	<a href="/photos/latest.html">{$LANG.NEW_PHOTO_IN_GALLERY}</a> <i class="icon-arrow-right"></i>
    {elseif $cfg.sort == 'rating'}
    	<a href="/photos/top.html">{$LANG.BEST_PHOTOS}</a> <i class="icon-arrow-right"></i>
    {elseif $cfg.is_full}
    	<a href="{if $photo.NSDiffer != ''}clubs/photoalbum{else}photos/{/if}{$photo.album_id}">{$photo.cat_title|escape:'html'}</a> <i class="icon-arrow-right"></i>
    {/if}
</div>
{/if}
