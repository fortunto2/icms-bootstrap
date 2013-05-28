{* ================================================================================ *}
{* ================ Вкладка "Статьи" в профиле пользователя ======================= *}
{* ================================================================================ *}

{if $total}
	<table class="contentlist" cellspacing="2" border="0" width="">
		{foreach key=id item=article from=$articles}
            <tr>
					<td width="20">
                       <i class="icon-file"></i>
                    </td>
					<td>
						<a href="{$article.url}" class="con_titlelink">{$article.title}</a>
					</td>
            </tr>
		{/foreach}
	</table>
{else}
	<p>Пользователь не добавлял статьи на сайт.</p>
{/if}