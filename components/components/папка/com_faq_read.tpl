{* ================================================================================ *}
{* ============================== Просмотр вопроса FAQ ============================ *}
{* ================================================================================ *}

<div class="con_heading">{$LANG.QUESTION_VIEW} {if $is_admin}<a href="/faq/delquest{$quest.id}.html">X</a>{/if}</div>
	
<ul class="media-list">
    <li class="media">
        <span class="pull-left"><i class="icon-question-sign"></i></span>
        <div class="media-body">
            <strong class="media-heading">
			{if $cfg.user_link}
				{if $quest.nickname}<a href="{profile_url login=$quest.login}">{$quest.nickname}</a>{else}{$LANG.QUESTION_GUEST}{/if}
			{/if}
			</strong><span>{$quest.pubdate}</span>
			<p>{$quest.quest}</p>
        </div>
    </li>    
</ul>
{if $quest.answer}
<ul class="media-list">
    <li class="media">
        <span class="pull-left"><i class="bac-vect-comment"></i></span>
        <div class="media-body">
		<div class="media-heading">{$quest.answerdate}</div>
			<div>{$quest.answer}</div>
        </div>
    </li>    
</ul>
{/if}
{if $cfg.is_comment}
{comments target='faq' target_id=$quest.id labels=$labels}
{/if}