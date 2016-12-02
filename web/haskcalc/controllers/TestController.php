<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 20:47
 */

namespace haskcalc\controllers;


use haskcalc\core\BaseController;

class TestController extends BaseController
{

    public function actionHello()
    {
        //$result = [];
        //exec("haskcalc addThem 1 3", $result);
        return var_dump($_POST);
    }

}