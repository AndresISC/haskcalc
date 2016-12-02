<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 20:19
 */

namespace haskcalc\controllers;


use haskcalc\core\BaseController;

class SiteController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}