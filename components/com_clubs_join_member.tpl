<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" onclick="clubs.intive_filter('all')" href="#home">Все</a></li>
    <li><a onclick="clubs.intive_filter('checked')" href="#profile" data-toggle="tab">Отмеченные (<span id="count_friends">0</span>)</a></li>
	<li>  <input id="friend_list_lookup" class="inputText" type="text"  onkeydown="clubs.intive_search();" onblur="{literal}if ($(this).val()==''){ $(this).val('поиск'); }" onclick="$(this).val('');{/literal}" value="поиск" style="margin:4px 0px;" ></li>
</ul>
<div class="clearFix"></div>
<div class="friend_list_body_ajax">
  <div id="flist_data">
  {foreach key=fid item=friend from=$friends}
    <div id="flist{$friend.id}" class="flist_cell" onclick="clubs.intive_click({$friend.id});" value="{$friend.id}">
      <div class="flist_border_wrap">
        <div class="flist_wrap">
          <div class="flist_div">
            <div class="flist_image">
              <img class="usr_img_small" border="0" src="{$friend.avatar}" />
            </div>
          </div>
          <div class="flist_name">{$friend.nickname}</div>
        </div>
      </div>
    </div>
  {/foreach}
  </div>
</div>