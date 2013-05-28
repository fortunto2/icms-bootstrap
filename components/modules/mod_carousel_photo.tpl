<div>
	{literal}
		<style type="text/css" scoped="scoped">
			#carPhotoBox ul,#carPhotoBox li{margin:0}
			#carPhotoBox{width:{/literal}{$cfg.width}{literal}px;height:{/literal}{$css.boxHeight}{literal}px;overflow:hidden;margin:0 auto}
			#carPhotoBox .jcarousel-clip{width:{/literal}{$css.realWidth}{literal}px;height:{/literal}{$css.boxHeight}{literal}px;overflow:hidden}
			#carPhotoBox .thumb_img{margin:3px;padding:3px;width:{/literal}{$css.photoWidth}{literal}px;height:{/literal}{$css.photoHeight}{literal}px;border:1px solid #fff;background:#e5e5e5;border-radius:5px;box-shadow:0px 0px 3px #666;position:relative}
			#carPhotoBox .thumb_img img{width:{/literal}{$css.photoWidth}{literal}px;height:{/literal}{$css.photoHeight}{literal}px;border-radius:5px}
			#carPhotoBox .jcarousel-container{padding:0 45px}
			#carPhotoBox .jcarousel-prev,#carPhotoBox .jcarousel-next{cursor:pointer;position:absolute;top:{/literal}{$css.buttonPosition}{literal}px;height:40px;width:40px}
			#carPhotoBox .jcarousel-prev{left:0;background:url(/modules/mod_carousel_photo/prev-next.png) 0 0 no-repeat}
			#carPhotoBox .jcarousel-prev:hover{background-position:0 -40px}
			#carPhotoBox .jcarousel-next{right:0;background:url(/modules/mod_carousel_photo/prev-next.png) 100% 0 no-repeat}
			#carPhotoBox .jcarousel-next:hover{background-position:100% -40px}
			#carPhotoBox,#carPhotoBox a{font-family:arial;font-style:normal;font-size:12px;font-weight:700;color:#eee;text-align:right}
			#carPhotoBox a{color:#a3f3fe}
			#carPhotoBox a:hover{color:#fff}
			#carPhotoBox .round{padding:1px 3px;background:#fff;border-radius:7px}
			#carPhotoBox .overlay{display:none;position:absolute;left:3px;right:3px;padding:3px 6px}
			#carPhotoBox .overTop{top:3px}
			#carPhotoBox .overBot{bottom:3px}
		</style>
		<script type="text/javascript" src="/modules/mod_carousel_photo/jcarousel.js"></script>
		<script type="text/javascript">
			function mycarousel_initCallback(a){a.buttonNext.bind("click",function(){a.startAuto(0)});a.buttonPrev.bind("click",function(){a.startAuto(0)});a.clip.hover(function(){a.stopAuto()},function(){a.startAuto()})};
			$(function(){$('#carPhoto').jcarousel({vertical:0,start:1,scroll:{/literal}{$cfg.scroll}{literal},auto:{/literal}{$cfg.interval}{literal},visible:{/literal}{$cfg.shownum}{literal},animation:'slow',wrap:'circular',initCallback:mycarousel_initCallback});
			$('.thumb_img').hover(function(){$(this).find('.overlay').css({'background':'rgba(0,0,0,0.6)'}).fadeIn(500)},function(){$(this).find('.overlay').stop(true,true).fadeOut(500)});});
		</script>
	{/literal}	
	<div id="carPhotoBox">
		<ul id="carPhoto">
			{foreach key=tid item=photo from=$photos}
				<li>
					<div class="thumb_img">
						<a href="/{if $photo.NSDiffer != ''}clubs{else}photos{/if}/photo{$photo.id}.html"><img src="/images/photos/{if $cfg.quality==1}medium{else}small{/if}/{$photo.file}" alt="{$photo.title|escape:'html'}" /></a>
						<div class="overlay overBot">
							{$photo.title|escape:'html'|truncate:20}<br/>
							<a href="/{if $photo.NSDiffer != ''}clubs/photoalbum{else}photos/{/if}{$photo.album_id}">{$photo.cat_title|truncate:20}</a>
						</div>
						{if $cfg.is_full}
							<div class="overlay overTop">
								{if $cfg.sort=='pubdate'}
									{$photo.pubdate}
								{elseif $cfg.sort=='rating'}
									Рейтинг - <span class="round">{$photo.rating|rating}</span>
								{else}
									Комментариев - <a href="/photos/photo{$photo.id}.html#c">{$photo.comments}</a>
								{/if}
							</div>
						{/if}
					</div>
				</li>
			{/foreach}
		</ul>
	</div>
</div>