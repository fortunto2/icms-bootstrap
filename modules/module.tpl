<div class="module{$mod.css_prefix}">
    {if $mod.showtitle neq 0}
        <div class="moduletitle{$mod.css_prefix}">
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
    <div class="modulebody{$mod.css_prefix}">{$mod.body}</div>
</div>
