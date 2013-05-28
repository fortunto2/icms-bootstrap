<ul id="{$menu}" class="nav">
		{if $cfg.show_home}
		<li {if $menuid==1}class="active"{/if}>
			<a href="/" {if $menuid==1}class="active"{/if}><span>{$LANG.PATH_HOME}</span></a>
		</li>
		{/if}

{foreach key=key item=item from=$items}
{if $item.allow_group == -1 || $item.allow_group == $user_group || $is_admin}
{if $item.published}
{if $item.parent_id != $hide_parent}
{if $item.NSLevel < $last_level} 
{math equation="x - y" x=$last_level y=$item.NSLevel assign="tail"}
{section name=foo start=0 loop=$tail step=1}
	</ul></li>
{/section}
{/if}

{if $item.NSRight - $item.NSLeft == 1}
	<li {if $menuid==$item.id}class="active"{/if}>
		<a href="{$item.link}" target="{$item.target}" {if $menuid==$item.id}class="active"{/if}><span>{$item.title}</span></a>
	</li>
{else}

 <li class="dropdown" {if ($menuid==$item.id || ($currentmenu.NSLeft > $item.NSLeft && $currentmenu.NSRight < $item.NSRight)) && $item.NSLevel<=1}class="active"{/if}>
 <a href="{$item.link}" target="{$item.target}" {if ($menuid==$item.id || ($currentmenu.NSLeft > $item.NSLeft && $currentmenu.NSRight < $item.NSRight)) && $item.NSLevel<=1}class="active"{/if} class="dropdown-toggle" data-toggle="dropdown"><span>{$item.title}</span><b class="caret"></b></a>
 <ul class="dropdown-menu">
 {/if}
 {assign var="last_level" value=$item.NSLevel}
 {/if}
 {else}
 {php}$this->_tpl_vars['hide_parent'] = $this->_tpl_vars['item']['id'];{/php}
 {/if}
 {/if}
 {/foreach}
 {section name=foo start=0 loop=$last_level step=1}
 </ul></li>
 {/section}
 </ul>
