<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 20:08
 */

namespace haskcalc\core;

use Twig_Environment;
use Twig_Loader_Filesystem;

class BaseController
{
    var $loader;
    var $twig;

    public function __construct()
    {
        $this->loader = new Twig_Loader_Filesystem(TEMPLATE_DIR);
        $this->twig = new Twig_Environment($this->loader, [
            //'cache' => ROOT . 'cache'
        ]);
    }

    public function render($templateName, $args = [])
    {
        return $this->twig->render($templateName . '.twig', $args);
    }

}