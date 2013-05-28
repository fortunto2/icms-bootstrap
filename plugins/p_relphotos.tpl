{literal}
        <script type="text/javascript">
		  $(document).ready(function() {
			$("#carousel").featureCarousel({
				largeFeatureWidth:100,
				largeFeatureHeight:100,
				smallFeatureWidth:50,
				smallFeatureHeight:50,
				topPadding:0,
				sidePadding:0,
				autoPlay: {/literal}{if $autoplay}4000{else}0{/if}{literal},
				smallFeatureOffset:25                                  
			});
		  });
        </script>
{/literal}

<div class="con_heading" style="margin-top:25px;">
    <h3>Похожие фотографии</h3>
</div>
<div class="row-fluid">
	{foreach key=tid item=photo from=$rel_photos}
        <div class="span3">
          <a href="/photos/photo{$photo.id}.html" class="thumb"><img class="img-polaroid" alt="{$photo.title}" src="/images/photos/small/{$photo.file}"></a> 
            <p>{$photo.title}</p>
		</div>
	{/foreach}
</div>