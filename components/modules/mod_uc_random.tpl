{if $is_uc}
<div class="row">
	{foreach key=tid item=item from=$items}
	<div class="uc_random  span3">
		<div class="row">
			<div align="center" class="span3">
				<a href="/catalog/item{$item.id}.html">
				<img src="/images/catalog/small/{$item.imageurl}.jpg">
				</a>
			</div>
		<div align="center" class="span3">
		{if $cfg.showtitle}
			<p><a href="/catalog/item{$item.id}.html"><strong>{$item.title}</strong></a></p>
			{if $item.viewtype == 'shop'}	
				{$item.price} {$LANG.UC_RANDOM_RUB}
				</br>
			{/if}
		{/if}

		{if $cfg.showcat}
			{$LANG.UC_RANDOM_RUBRIC} <a href="/catalog/{$item.category_id}">{$item.category}</a>
		{/if}
		</div>
		</div>
	</div>
	{/foreach}
</div>	
{else}
	<p>{$LANG.UC_RANDOM_NO_ITEMS}</p>
{/if}