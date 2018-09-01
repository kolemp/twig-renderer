<?php
require_once '/var/lib/php/twig/vendor/autoload.php';

$filePath = $argv[1];

$pathArray = explode("/", $filePath);
$templateFile = array_pop($pathArray);
$workdir = implode("/", $pathArray);

$loader = new Twig_Loader_Filesystem($workdir);
$twig = new Twig_Environment($loader);

echo $twig->render($templateFile);
