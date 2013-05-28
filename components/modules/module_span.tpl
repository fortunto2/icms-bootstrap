<div class="module span{$mod.css_prefix}">
    {if $mod.showtitle neq 0}
        <div class="moduletitle">
            {$mod.title}
            {if $cfglink}
                <span class="fast_cfg_link">
                    <a href="javascript:moduleConfig({$mod.id})" title="Настроить модуль">
                        <i class="icon-wrench"></i>
                    </a>
                </span>
            {/if}
			<div class="separator"></div>
        </div>
    {/if}
    <div class="modulebody">{$mod.body}</div>
</div>