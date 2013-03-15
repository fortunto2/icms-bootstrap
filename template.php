<?php
/******************************************************************************/
//                                                                            //
//                             Instantcms v1.10                               //
//                        http://www.Instantcms.ru/                           //
//                                                                            //
//                   written by Instantcms Team, 2007-2012                    //
//                produced by UniversalSoft, (www.Universalsoft.ru)               //
//                                                                            //
//                        LICENSED BY GNU/GPL v2                              //
//                                                                            //
/******************************************************************************/

    if(!defined('VALID_CMS')) { die('ACCESS DENIED'); }
    $inUser = cmsUser::getInstance();
  $inPage = cmsPage::getInstance();
	
	$mod_count['left'] = $inPage->countModules('left');
    $mod_count['right'] = $inPage->countModules('right');
	
	$is_left  = cmsCountModules('left');
	$is_right = cmsCountModules('right');

	if ($is_left && $is_right) { 
     //включена левая и правая колонка
     $class = "span6";
	} else if ($is_left) {
     //включена только левая колонка
     $class = "span9";
	} else if ($is_right) {
     //включена только правая колонка
     $class = "span9";} 
	else {
     //боковых колонок нет
     $class = "span12";}
	?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <!-- HEAD !-->
    <?php $inPage->printHead(); ?>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content=" chrome=1" />
    <?php if($inUser->is_admin){ ?>
        <script src="/admin/js/modconfig.js" type="text/javascript"></script>
        <script src="/templates/bootstrap/js/nyromodal.js" type="text/javascript"></script>
        <link href="/templates/bootstrap/css/modconfig.css" rel="stylesheet" type="text/css" />
        <link href="/templates/bootstrap/css/nyromodal.css" rel="stylesheet" type="text/css" />
    <?php } ?>
	<script src="/templates/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <link href="/templates/bootstrap/css/styles.css" rel="stylesheet" type="text/css" />
	<link href="/templates/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="/templates/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
	<link href="/templates/bootstrap/css/planeta.css" rel="stylesheet" type="text/css" />
	<link href="/templates/bootstrap/css/css.css" rel="stylesheet" type="text/css" />

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>
<?php if (cmsConfig::getConfig('siteoff') && $inUser->is_admin) { ?>
<div style="margin:4px; padding:5px; border:solid 1px red; background:#FFF; position: fixed;opacity: 0.8; z-index:999"><strong style="color:red">Сайт отключен.</strong> Только администраторы видят его содержимое.</div>
<?php } ?>
    <div id="wrap">
    <div class="container">
		<div id="header">
		<div class="row">
		<div class="span12">
		<div class="navbar"> 
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <div class="nav-collapse collapse">
            <?php $inPage->printModules('topmenu'); ?>
            </div><!--/.nav-collapse --> 
			<?php if (!$inUser->id){ ?>
			<ul class="nav">
			<li>
				<a href="/registration" class="reg">Регистрация</a>
			</li>
			<li>
				<a href="#myModal" role="button" class="reg" data-toggle="modal">Вход</a>
			</li>
		
				<!-- Modal -->	
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Авторизация</h3>
			</div>
			<div class="modal-body">
				<?php $inPage->printModules('auth'); ?>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Закрыть</button>
			</div>
		</div>	<!-- end Modal -->
		<?php } ?>
			</ul>
		</div>
		</div>
              <div id="logo" class="span4"><a class="brand" href="#">Go Bootstrap</a></div>
              <div id="head-banner" class="span6">Banner</div>
        </div>
		</div>
        <div id="page">		
		<!-- Static navbar -->
    <div class="navbar">
        <div class="navbar-inner">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <div class="nav-collapse collapse">
            <?php $inPage->printModules('topmenu'); ?>
            </div><!--/.nav-collapse -->
          </div>
        </div>
    </div>
                <div id="pathway">
                    <?php $inPage->printPathway('<span class="divider">/</span>'); ?>
                </div>
            <div id="mainbody" class="row">
                 <?php if ($mod_count['left']) { ?>
                    <div class="span3" id="left"><?php $inPage->printModules('left'); ?></div>
                <?php } ?>
				 <div id="main" class="<?php echo $class; ?>">
                    <?php $inPage->printModules('maintop'); ?>
                    <?php $messages = cmsCore::getSessionMessages(); ?>
                    <?php if ($messages) { ?>
                    <div class="sess_messages">
                        <button class="close" data-dismiss="alert" type="button">×</button>
						<?php foreach($messages as $message){ ?>
                            <?php echo $message; ?>
                        <?php } ?>
                    </div>
                    <?php } ?>

                    <?php if($inPage->page_body){ ?>
                        <div class="component">
                             <?php $inPage->printBody(); ?>
                        </div>
                    <?php } ?>
                    <?php $inPage->printModules('mainbottom'); ?>
                </div>
                <?php if ($mod_count['right']) { ?>
                    <div class="span3" id="right"><?php $inPage->printModules('right'); ?></div>
                <?php } ?>
            </div>

        </div>
		<div class="row">
              <div class="span4"><?php $inPage->printModules('foot1'); ?></div>
              <div class="span3"><?php $inPage->printModules('foot2'); ?></div>
              <div class="span3"><?php $inPage->printModules('foot3'); ?></div>
			  <div class="span2"><?php $inPage->printModules('foot4'); ?></div>
        </div>
	</div>
		<div id="push"></div>
    </div>
    <div id="footer">
      <div class="container">
		<div id="copyright">				
			<div class="inner">
				<div class="left"><p>© Сделано на <a href="#">Instant</a> и  <a href="#">Bootstrap</a>.</p></div>
				<div class="right"><p>Наши группы <a href="#">Twitter</a>, <a href="#">Dribbble</a> &amp; <a href="#">Facebook</a></p></div>
			</div>			
		</div><!-- End "copyright" -->
      </div>
    </div>
</body>

</html>
