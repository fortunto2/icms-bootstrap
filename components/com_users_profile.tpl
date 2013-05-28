{add_js file='includes/jquery/tabs/jquery.ui.min.js'}

{literal}
	<script type="text/javascript">
		$(document).ready(function(){
			$("#profiletabs").tabs();
		});
	</script>
{/literal}
<div id="usertitle">
    <div id="user_ratings">
        <div class="karma" title="{$LANG.KARMA}">
        	<div class="btn disabled" id="u_karma_cont">
                <table cellpadding="2" cellspacing="0"><tr>
                    <td class="sign_link">
                    {if $usr.can_change_karma}
                        <a href="javascript:void(0)" onclick="users.changeKarma('{$usr.id}', 'plus');return false;" title="{$LANG.KARMA} +"><i class="icon-thumbs-up"></i></a>
                    {/if}
                    </td>
                    <td><span class="user_karma_point" id="u_karma">{$usr.karma}</span></td>
                    <td class="sign_link">
                    {if $usr.can_change_karma}
                        <a href="javascript:void(0)" onclick="users.changeKarma('{$usr.id}', 'minus'); return false;" title="{$LANG.KARMA} -"><i class="icon-thumbs-down"></i></a>
                    {/if}
                    </td>
                </tr>
				</table>
            </div>
        </div>
        <div class="rating" title="{$LANG.RATING}">
            <div class="btn disabled">{$usr.user_rating}</div>
        </div>
    </div>
</div>
<div class="row">
<div class="span3">
<div class="usr_avatar">{* ======аватар==== *}
		<div class="usr_ava_name">
			<div class="lip-heading {$usr.group_alias}"> {$usr.grp} </div>
				<div class="lip-content " id="nickname">
					<h1>{$usr.nickname} {if $usr.banned}<span style="color:red; font-size:12px;">{$LANG.USER_IN_BANLIST}</span>{/if}</h1>
				</div>
		</div>
    <div class="img-polaroid">
	<img src="{$usr.avatar}" />
	{if $myprofile}
	<div class="set-avatar">
 	<a href="/users/{$usr.id}/avatar.html" title="{$LANG.SET_AVATAR}"><i class="bac-white bac-user-switch"></i> {$LANG.SET_AVATAR}</a>           
	</div>
	{/if}
	</div>
</div>						
{* ===============================меню в профиле================================================= *}
						<div id="usermenu">
                            <ul class="usr_profile_menu nav">
							{if $is_auth}
							{if !$myprofile}
                                <li>
                                    <a class="ajaxlink" href="javascript:void(0)" title="{$LANG.WRITE_MESS}: {$usr.nickname|escape:'html'}" onclick="users.sendMess('{$usr.id}', 0, this);return false;"><i class="bac-message"></i> {$LANG.WRITE_MESS}</a>
                                </li>
							{/if}

                            {if !$myprofile}
                            	{if !$usr.isfriend}
                                    <li> 
                                       <a class="ajaxlink" href="javascript:void(0)" title="{$usr.nickname|escape:'html'}" onclick="users.addFriend('{$usr.id}', this);return false;"><i class="bac-vision-group"></i> {$LANG.ADD_TO_FRIEND}</a>
                                    </li>
                                {else}
								<li class="add_friend_ajax" style="display: none;">
									<a class="ajaxlink" href="javascript:void(0)" title="{$usr.nickname|escape:'html'}" onclick="users.addFriend('{$usr.id}', this);return false;"><i class="bac-vision-group"></i> {$LANG.ADD_TO_FRIEND}</a>
								</li>
								<li class="del_friend_ajax">
									<a id="del_friend" class="ajaxlink" href="javascript:void(0)" title="{$usr.nickname|escape:'html'}" onclick="users.delFriend('{$usr.id}', this);return false;"><i class="bac-vision-some"></i> {$LANG.STOP_FRIENDLY}</a>
								</li>
                                {/if}
                            {/if}
                         	{if $myprofile}
                            	{if $cfg.sw_msg}
                                <li>
                                <a href="/users/{$usr.id}/messages.html" title="{$LANG.MY_MESS}"> <i class="bac-message"></i> {$LANG.MY_MESS}</a>
                                </li>
                                {/if}
                                {if $cfg.sw_photo}
                                <li>
									<a href="/users/addphoto.html" title="{$LANG.ADD_PHOTO}"><i class="bac-photo"></i> {$LANG.ADD_PHOTO}</a>
                                </li>
                                {/if}
								{if $usr.invites_count}
                                <li>
                                    <a href="/users/invites.html" title="{$LANG.MY_INVITES}"><i class="bac-attach-mention"></i> {$LANG.MY_INVITES} {$usr.invites_count}</a>
                                </li> 
								{/if}
                                <li>
                                    <a href="/users/{$usr.id}/editprofile.html" title="{$LANG.CONFIG_PROFILE}"><i class="bac-profile-settings"></i> {$LANG.MY_CONFIG}</a>
                                </li> 
                            {/if}
                            {if $is_admin && !$myprofile}
                            <li>
                                <a href="/users/{$usr.id}/editprofile.html" title="{$LANG.CONFIG_PROFILE}"><i class="bac-profile-settings"></i> {$LANG.CONFIG_PROFILE}</a>
                            </li> 
                            {/if}
                            <li>
                                <a href="/users/{$usr.id}/karma.html" title="{$LANG.KARMA_HISTORY}"><i class="bac-graph"></i> {$LANG.KARMA_HISTORY}</a>
                            </li> 
							{if !$myprofile}
                            	{if $is_admin}
                                	{if !$usr.banned}
                                    <li>
                                        <a href="/users/{$usr.id}/giveaward.html" title="{$LANG.TO_AWARD}"><i class="bac-cup"></i> {$LANG.TO_AWARD}</a>
                                    </li> 
                                    {if $usr.id != 1}
                                    <li>
                                       <a href="/admin/index.php?view=userbanlist&do=add&to={$usr.id}" title="{$LANG.TO_BANN}"><i class="bac-ban"></i> {$LANG.TO_BANN}</a>
                                    </li> 
                                    {/if}
                                    {/if}
                                {if $usr.id != 1}
                                    <li>
                                        <a href="/users/{$usr.id}/delprofile.html" title="{$LANG.DEL_PROFILE}"><i class="bac-dismiss"></i> {$LANG.DEL_PROFILE}</a>
                                    </li>
                                {/if}
                                {/if}
                         	{/if}
							<li class="separat"></li>
							{/if}
                            <div class="usr_wall_header">
                                {if !$myprofile}
                                    {$LANG.USER_CONTENT}
                                {else}
                                    {$LANG.MY_CONTENT}
                                {/if}
                            </div>
                            
                                {if $cfg.sw_blogs}
                                    {if $usr.blog}
                                        <li id="usr_blog"><a href="/blogs/{$usr.blog.seolink}" title="{$usr.blog.title|escape:'html'}"><i class="bac-blog-user"></i> {$LANG.BLOG}</a></li>
                                    {elseif $myprofile}
                                        <li id="usr_blog"><a href="/blogs/createblog.html"><i class="bac-blog-user"></i> {$LANG.CREATE_BLOG}</a></li>
                                    {/if}
                                {/if}
							
                                {if $cfg.sw_files}
                                    <li id="usr_files">
                                        <a href="/users/{$usr.id}/files.html"><i class="bac-download"></i> {$LANG.FILES} <sup>{$usr.files_count}</sup></a>
                                    </li>
                                {/if} 
                                {if $cfg.sw_forum && $cfg_forum.component_enabled && $usr.forum_count}
                                    <li id="usr_forum">
                                        <a href="/forum/{$usr.login}_activity.html" title="{$LANG.MY_ACTIVITY_ON_FORUM}"><i class="bac-group"></i> {$LANG.FORUM} <sup>{$usr.forum_count}</sup></a> 
                                    </li>
                                {/if}
								{if $cfg.sw_board && $usr.board_count}
                                    <li id="usr_board">
                                        <a href="/board/by_user_{$usr.login}"><i class="bac-shop"></i> {$LANG.ADVS} <sup>{$usr.board_count}</sup></a>
                                    </li>
                                {/if}								
                                {if $cfg.sw_comm && $usr.comments_count}
                                    <a href="/comments/by_user_{$usr.login}" title="{$LANG.READ}"><li id="usr_comments"><i class="bac-vect-comment-bubble"></i> {$LANG.COMMENTS} <sup>{$usr.comments_count}</sup></a>
                                    </li>
                                {/if}
							<li class="separat"></li>
							</ul>
						{if $usr.friends}
                            <div class="usr_friends_block usr_profile_block">
                                <div class="usr_wall_header">
                                    {if !$myprofile}
                                        {$LANG.USER_FRIENDS}
                                    {else}
                                        {$LANG.MY_FRIENDS}
                                    {/if}
								{if $usr.friends_total > 6}
                                    <span class="float_bar">
                                        <a href="/users/{$usr.id}/friendlist.html">{$LANG.ALL_FRIENDS}</a> ({$usr.friends_total})
                                    </span>
                                {/if}	
                                </div>
                                {assign var="col" value="1"}
                                <ul class="usr_friends_list">
                                  {foreach key=tid item=friend from=$usr.friends}
                                                <li class="usr_friend_cell">
                        <a data-toggle="tooltip" title="{$friend.nickname}" href="{profile_url login=$friend.login}"><img class="usr_img_small" src="{$friend.avatar}" /></a>
                                                    {$friend.flogdate}
                                                </li>
                                      {if $col==6} </ul>{assign var="col" value="1"} {else} {math equation="x + 1" x=$col assign="col"} {/if}
                                  {/foreach} 
                            </div>
                        {/if}                            						
						</div>
{* ================================================================================ *}
	    </div>
    <div class="span6">
		<div class="set-status">
			<div class="usr_status_text" {if !$usr.status_text}style="display:none"{/if}>
				<span class="status-text">{$usr.status_text|escape:'html'}</span>
				<span class="usr_status_date" >// {$usr.status_date} {$LANG.BACK}</span>
			{if $myprofile || $is_admin}
				<a href="javascript:" onclick="setStatus({$usr.id})"><i class="bac-small-edit"></i></a>
			{/if}
			</div>	        
		</div>
			<div id="profiletabs">
				<ul id="tabs">
					<li><a href="#upr_profile"><span>{$LANG.PROFILE}</span></a></li>
					{if $myprofile && $cfg.sw_feed}
						<li><a href="/actions/my_friends" title="upr_feed"><span>{$LANG.FEED}</span></a></li>
					{/if}
					{if $cfg.sw_clubs}
						<li><a href="/clubs/by_user_{$usr.id}" title="upr_clubs"><span>{$LANG.CLUBS}</span></a></li>
					{/if}
                    {if $cfg.sw_awards}
                        <li><a href="#upr_awards"><span>{$LANG.AWARDS}</span></a></li>
                    {/if}
                    {foreach key=id item=plugin from=$plugins}
                        <li><a href="#upr_{$plugin.name}"><span>{$plugin.title}</span></a></li>
                    {/foreach}
				</ul>
				{* ============================== ЗАКЛАДКА №1 ============================================== *}				
				<div id="upr_profile">
					<div class="user_profile_data">

						<div class="field">
							<div class="title">{$LANG.LAST_VISIT}:</div>
							<div class="value">{$usr.flogdate}</div>
						</div>
						<div class="field">
							<div class="title">{$LANG.DATE_REGISTRATION}:</div>
							<div class="value">
                                {$usr.fregdate}
                            </div>
						</div>
                        {if $usr.inv_login}
                            <div class="field">
                                <div class="title">{$LANG.INVITED_BY}:</div>
                                <div class="value">
                                    <a href="{profile_url login=$usr.inv_login}">{$usr.inv_nickname}</a>
                                </div>
                            </div>
                        {/if}
                        {if $usr.city}
						<div class="field">
							<div class="title">{$LANG.CITY}:</div>
                            <div class="value"><a href="/users/city/{$usr.cityurl|escape:'html'}">{$usr.city}</a></div>
						</div>
                        {/if}

						{if $usr.showbirth && $usr.fbirthdate}
						<div class="field">
							<div class="title">{$LANG.BIRTH}:</div>
							<div class="value">{$usr.fbirthdate}</div>
						</div>
						{/if}

						{if $usr.fgender}
						<div class="field">
							<div class="title">{$LANG.SEX}:</div>
							<div class="value">{$usr.fgender}</div>
						</div>
						{/if}

						{if $usr.showicq && $usr.icq}
						<div class="field">
							<div class="title">ICQ:</div>
							<div class="value">{$usr.icq}</div>
						</div>
						{/if}

						{if $usr.showmail}
							{add_js file='includes/jquery/jquery.nospam.js'}
							<div class="field">
								<div class="title">E-mail:</div>
								<div class="value"><a href="#" rel="{$usr.email|NoSpam}" class="email">{$usr.email}</a></div>
							</div>
							{literal}
								<script>
										$('.email').nospam({ replaceText: true });
								</script>
							{/literal}
						{/if}

						<div class="field">
							<div class="title">{$LANG.HOBBY} ({$LANG.TAGSS}):</div>
							<div class="value">{if $usr.fdescription}{$usr.fdescription}{else}<span style="color:#999"><em>{$LANG.TAGS_NOT_SPEC}</em></span>{/if}</div>
						</div>

						{if $cfg.privforms && $usr.form_fields}
							{foreach key=tid item=field from=$usr.form_fields}
                                <div class="field">
                                    <div class="title">{$field.title}:</div>
                                    <div class="value">{if $field.field}{$field.field}{else}<em>{$LANG.NOT_SET}</em>{/if}</div>
                                </div>
                            {/foreach}
						{/if}

					</div>

					<div>


                        {if $usr.albums}
                            <div class="usr_albums_block usr_profile_block">
                                {if $usr.albums_total > $usr.albums_show}
                                    <div class="float_bar">
                                        <a href="/users/{$usr.id}/photoalbum.html">{$LANG.ALL_ALBUMS}</a> ({$usr.albums_total})
                                    </div>
                                {/if}
                                <div class="usr_wall_header">
                                    {if !$myprofile}
                                        {$LANG.USER_PHOTOS}
                                    {else}
                                        {$LANG.MY_PHOTOS}
                                    {/if}
                                </div>
                                <ul class="usr_albums_list">
                                    {foreach key=key item=album from=$usr.albums}
                                        <li>
                                            <div class="usr_album_thumb img-polaroid">
                                                <a href="/users/{$usr.login}/photos/{$album.type}{$album.id}.html" title="{$album.title|escape:'html'}">
                                                    <img src="{$album.imageurl}" width="64" height="64" alt="{$album.title|escape:'html'}" />
                                                </a>
                                            </div>
                                            <div class="usr_album">
                                                <div class="link">
                                                    <a href="/users/{$usr.login}/photos/{$album.type}{$album.id}.html">{$album.title}</a>
                                                </div>
                                                <div class="count">{$album.photos_count|spellcount:$LANG.PHOTO:$LANG.PHOTO2:$LANG.PHOTO10}</div>
                                                <div class="date">{$album.pubdate}</div>
                                            </div>
                                        </li>
                                    {/foreach}
                                 </ul>
                            </div>
                        {/if}

                        

						{if $cfg.sw_wall}
							<div class="usr_wall usr_profile_block">
								<div class="usr_wall_header">
                                    {$LANG.USER_WALL}
                                    <div class="usr_wall_addlink" style="float:right">
                                        <a href="javascript:void(0)" id="addlink" class="ajaxlink" onclick="addWall('users', '{$usr.id}');return false;">
                                            <span><i class="icon-plus-sign"></i> {$LANG.WRITE_ON_WALL}</span>
                                        </a>
                                    </div>
                                </div>
								<div class="usr_wall_body" style="clear:both">
                                    <div class="wall_body">{$usr.wall_html}</div>
                                </div>
							</div>
						{/if}
					</div>
				</div>

				{* ============================== ЗАКЛАДКА №2 ============================================== *}
				{if $myprofile && $cfg.sw_feed}
					<div id="upr_feed">

					</div>
				{/if}

				{* ============================== ЗАКЛАДКА №5 ============================================== *}
				{if $cfg.sw_clubs}
					<div id="upr_clubs">

					</div>
				{/if}

				{* ============================== ЗАКЛАДКА №6 ============================================== *}

                {if $cfg.sw_awards}
					<div id="upr_awards">
						<div class="awards_list_link">
							<a href="/users/awardslist.html">{$LANG.HOW_GET_AWARD}</a>
						</div>
						{if $usr.awards}
                            {foreach key=tid item=aw from=$usr.awards}
                                <div class="usr_award_block">
                                  <table style="width:100%; margin-bottom:2px;" cellspacing="2">
                                    <tr>
                                      <td class="usr_com_title"><strong>{$aw.title}</strong>
                                      {if $is_admin}
                                        [<a href="/users/delaward{$aw.id}.html">{$LANG.DELETE}</a>]
                                      {/if}
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="usr_com_body">
                                        <table border="0" cellpadding="5" cellspacing="0">
                                          <tr>
                                            <td valign="top"><img src="/images/users/awards/{$aw.imageurl}" alt="{$aw.title|escape:'html'}"/></td>
                                            <td valign="top">{$aw.description}
                                              <div class="usr_award_date">{$aw.pubdate}</div></td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                            {/foreach}
						{/if}
					</div>
                {/if}

                {foreach key=id item=plugin from=$plugins}
                    <div id="upr_{$plugin.name}">{$plugin.html}</div>
                {/foreach}
			</div>
	</div>
</div>
