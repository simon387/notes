<? function printTestata($s1, $s2) {
  return '<!DOCTYPE html><!--[if lt IE 7]><html class="no-js ie6" lang="it"> <![endif]--><!--[if IE 7]><html class="no-js ie7" lang="it"><![endif]--><!--[if IE 8]><html class="no-js ie8" lang="it"><![endif]--><!--[if gt IE 8]><!--> <html class="no-js" lang="it"><!--<![endif]-->
<head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><!-- Always force latest IE rendering engine & Chrome Frame -->
<title>www.simonecelia.it</title><meta name="description" content="sito personale simone celia">
<meta name="viewport" content="width=device-width"><link href="style.css" rel="stylesheet"><link href="//fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700|Merriweather:400,700,900" rel="stylesheet">
<script src="js/modernizr-2.6.1.min.js"></script></head>
<body><!--[if lt IE 8]><p class="chromeframe alert alert-warning">Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
<header id="master-header" class="clearfix" role="banner">
 <hgroup>
  <h1 id="site-title"><a href="index.php" title="www.simonecelia.it">www.simonecelia.it</a></h1>
  <h2 id="site-description">Il sito &egrave; ancora in costruzione!</h2>
 </hgroup></header><div id="main" class="row clearfix"><nav class="main-navigation clearfix span12" role="navigation">
<h3 class="assistive-text">Main menu</h3><ul>
<li class="' . $s1 . '"><a href="index.php">Home</a></li>
<li class="' . $s2 . '"><a href="mieisoftware.php">Downloads</a>
  <ul class="sub-menu">
    <li><a href="downloads/ytdl.zip" target="_blank">YTDLUI</a></li>
    <!--li><a href="mieisoftware.php">I miei software</a></li-->
  </ul>
</li>
<li><a href="downloads/simone_celia_CV.pdf" target="_blank">Curriculum Vitae</a></li>
<li><a href="phpminiadmin.php" target="_blank">DB access</a></li>
</ul>
</nav>';
}?>