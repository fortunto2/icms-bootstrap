{* ================================================================================ *}
{* ============================ Просмотр категории FAQ ============================ *}
{* ================================================================================ *}

{* ============================ Ссылка "Задать вопрос" ============================ *}
<div class="clearfix">
{if $is_user || $cfg.guest_enabled}
<div class="con_heading pull-right">
    <a class="btn" href="/faq/sendquest{if $id>0}{$id}{/if}.html"><i class="icon-plus-sign"></i>{$LANG.SET_QUESTION}</a>
</div>
{/if}
<div class="con_heading pull-left">{$pagetitle}</div>
</div>
{* ============================ Подкатегории ============================ *}
{if $is_subcats}
	{if $id>0}
		<div class="faq_subcats">
	{else}
		<div class="faq_cats">
	{/if}

{foreach key=tid item=subcat from=$subcats}
<div class="media">
    <span class="pull-left"><i class="icon-folder-open"></i></span>
        <div class="media-body">
            <strong class="media-heading"><a href="/faq/{$subcat.id}">{$subcat.title}</a></strong>
            {if $subcat.description}
				<div>{$subcat.description}</div>
			{/if}
        </div>
</div>
{/foreach}
		</div>
{/if}

{* ============================ Список вопросов ============================ *}
{if $is_quests}
    {if $id==0}
        <h1 class="con_heading">{$LANG.LAST_QUESTIONS}</h1>
    {/if}
	{foreach key=tid item=quest from=$quests}

<div class="media">
    <span class="pull-left"><i class="icon-question-sign"></i></span>
        <div class="media-body">
	{if $cfg.user_link}
		<strong class="media-heading">
             {if $quest.nickname}<a href="{profile_url login=$quest.login}">{$quest.nickname}</a>{else}{$LANG.QUESTION_GUEST}{/if}
		</strong>
    {/if}
	<span>{$quest.pubdate} 
	{if $id==0}
        &rarr;  <a href="/faq/{$quest.cid}">{$quest.cat_title}</a>
    {/if}
	</span> 			
    <div class="faq_quest_link"><a href="/faq/quest{$quest.id}.html">{$quest.quest}</a></div>
        </div>
</div>

	{/foreach}
	{if $id > 0} {$pagebar} {/if}
{/if}
	