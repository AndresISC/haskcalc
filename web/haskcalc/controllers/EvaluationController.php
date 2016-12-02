<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 21:10
 */

namespace haskcalc\controllers;


use haskcalc\utils\HaskellCalc;
use haskcalc\utils\Parser;

class EvaluationController
{
    public function actionEval()
    {
        $eval = $_POST['output'];
        $mode = $_POST['modo'];
        $parsed = Parser::parseEquation($eval);
        return HaskellCalc::evalString($parsed, [
            'mode' => $mode
        ]);
    }
}