<?php
require_once '/var/lib/php/twig_renderer/vendor/autoload.php';

$filePath = $argv[1];

if (!file_exists($filePath)) {
    $message = "cwd: " . getcwd() . PHP_EOL;
    exec("ls -la", $output);
    $message .= "\ncwd files list:\n" . print_r($output, true);
    throw new \Exception("File '$filePath' not found! \n" . $message);
}

$pathArray = explode("/", $filePath);
$depth = count($pathArray);
$templateFile = array_pop($pathArray);

if ($depth === 1) {
    $workdir = getcwd();
} else {
    $workdir = implode("/", $pathArray);
}

$loader = new Twig_Loader_Filesystem($workdir);
$twig = new Twig_Environment($loader);
$twig->addExtension(new \TwigRenderer\TwigRendererExtension());

echo $twig->render($templateFile);
