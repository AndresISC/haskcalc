<?php

require 'constants.php';
require ROOT . 'vendor' . DS . 'autoload.php';

$loader = new Twig_Loader_Filesystem(TEMPLATE_DIR);
$twig = new Twig_Environment($loader, [
    //'cache' => ROOT . 'cache'
]);

echo $twig->render('index.twig');
