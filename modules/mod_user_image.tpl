{if $is_usr}
	{foreach key=tid item=usr from=$users}
		<div align="center">
		<a href="/users/{$usr.uid}/photo{$usr.id}.html">
			<img src="/images/users/photos/small/{$usr.imageurl}">
		</a>
		</div>
		{if $cfg.showtitle}
			<div align="center"><strong>{$usr.title}</strong></div>
			<div align="center">{$usr.genderlink}</a></div>
		{/if}
	{/foreach}
{else}
	<p>Нет данных для отображения.</p>
{/if}