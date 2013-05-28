{* ========================= Просмотр фотографии ================================== *}
{strip}
    {if $is_allow}
<div itemscope itemtype="http://schema.org/ImageObject">
<h2 class="con_heading" itemprop="name">{$photo.title}</h2>
<ul class="inline">
    <li><span itemprop="author">{$photo.genderlink}</span> &mdash;</li>
	<li> <meta itemprop="datePublished" content="{$photo.pubdate_dop}">{$photo.pubdate} &mdash;</li>
	<li><strong>{$LANG.HITS}:</strong> {$photo.hits}</li>
{if $myprofile || $is_admin}
    <li><i class="icon-pencil"></i> <a class="usr_photo_link_edit" href="/users/{$usr.id}/editphoto{$photo.id}.html">{$LANG.EDIT}</a></li>
    <li><i class="icon-minus-sign"></i> <a class="usr_photo_link_delete"  href="/users/{$usr.id}/delphoto{$photo.id}.html">{$LANG.DELETE}</a></li>   
{/if}
</ul>
<p class="text-center">
{if $previd}
    <a class="btn" href="/users/{$usr.id}/photo{$previd.id}.html" title="{$previd.title|escape:'html'}"><i class="icon-arrow-left"></i>{$LANG.PREVIOUS}</a>
    {else}
    &nbsp;
{/if}
{if $nextid}
     <a class="btn" href="/users/{$usr.id}/photo{$nextid.id}.html" title="{$nextid.title|escape:'html'}">{$LANG.NEXT}<i class="icon-arrow-right"></i></a>
{else}
    &nbsp;
{/if}
</p>
<div class="text-center">
	{if $nextid}<a href="/users/{$usr.id}/photo{$nextid.id}.html">{/if}
        <img itemprop="contentUrl" class="img-polaroid" src="/images/users/photos/medium/{$photo.imageurl}" alt="{$photo.title|escape:'html'}">
    {if $nextid}</a>{/if}
</div>
  {if $photo.description}
  <br>
  <p itemprop="description">{$photo.description}</p>
  {/if}
</div>
{else}
<div class="con_heading">{$photo.title}</div>
<ul class="inline">
    <li>{$photo.genderlink} &mdash;</li>
	<li>{$photo.pubdate} &mdash;</li>
	<li><strong>{$LANG.HITS}:</strong> {$photo.hits}</li>
</ul>
<p class="text-center">
{if $previd}
    <a class="btn" href="/users/{$usr.id}/photo{$previd.id}.html" title="{$previd.title|escape:'html'}"><i class="icon-arrow-left"></i>{$LANG.PREVIOUS}</a>
    {else}
    &nbsp;
{/if}
{if $nextid}
     <a class="btn" href="/users/{$usr.id}/photo{$nextid.id}.html" title="{$nextid.title|escape:'html'}">{$LANG.NEXT}<i class="icon-arrow-right"></i></a>
{else}
    &nbsp;
{/if}
</p>
<div class="text-center">
    {if $nextid}
    <a href="/users/{$usr.id}/photo{$nextid.id}.html" title="{$nextid.title|escape:'html'}"></a>
    {else}
    &nbsp;
    {/if}
</div>
{/if}
{/strip}