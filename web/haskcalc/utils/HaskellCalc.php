<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 21:13
 */

namespace haskcalc\utils;


class HaskellCalc
{
    public static function evalString($parsed, $args = [])
    {
        // Maybe it's trigonometric
        if (sizeof($parsed) == 1) {
            $parsed = Parser::parseTrigonometric($parsed[0]);
            return self::trigEval($parsed, $args['mode']);
        }
        // Else, it can be a normal operation
        return self::_normalEval($parsed[1], $parsed[0], $parsed[2]);
    }

    private static function trigEval($parsed, $mode)
    {
        if (sizeof($parsed) == 1)
            return $parsed[0];
        return self::_trigEval($parsed[0], $parsed[1], $mode);
    }

    private static function _trigEval($operation, $arg, $mode)
    {
        switch ($operation) {
            case "sin":
                return self::sin($arg, $mode);
            case "cos":
                return self::cos($arg, $mode);
            case "tan":
                return self::tan($arg, $mode);
            case "ctg":
                return self::ctg($arg, $mode);
            case "sec":
                return self::sec($arg, $mode);
            case "csc":
                return self::csc($arg, $mode);
        }
        return "ERROR";
    }

    private static function _normalEval($operation, $n1, $n2)
    {
        switch ($operation) {
            case "+":
                return self::addThem($n1, $n2);
            case "-":
                return self::subtractThem($n1, $n2);
            case "x":
                return self::multiplyThem($n1, $n2);
            case "/":
                break;
            case "^":
                break;
            case "!":
                break;
        }
    }

    public static function addThem($n1, $n2)
    {
        return self::_eval('addThem', sprintf('%d %d', $n1, $n2));
    }

    public static function subtractThem($n1, $n2)
    {
        return self::_eval('subtractThem', sprintf('%d %d', $n1, $n2));
    }

    private static function multiplyThem($n1, $n2)
    {
        return self::_eval('multiplyThem', sprintf('%d %d', $n1, $n2));
    }

    public static function cos($value, $mode)
    {
        return self::_eval('cos', sprintf('%d %s', $value, $mode));
    }

    public static function sin($value, $mode)
    {
        return self::_eval('sin', sprintf('%d %s', $value, $mode));
    }

    public static function tan($value, $mode)
    {
        return self::_eval('tan', sprintf('%d %s', $value, $mode));
    }

    public static function ctg($value, $mode)
    {
        return self::_eval('ctg', sprintf('%d %s', $value, $mode));
    }

    public static function sec($value, $mode)
    {
        return self::_eval('sec', sprintf('%d %s', $value, $mode));
    }

    public static function csc($value, $mode)
    {
        return self::_eval('csc', sprintf('%d %s', $value, $mode));
    }

    private static function _eval($action, $spfstring)
    {
        $result = [];
        exec('haskcalc ' . $action . ' ' . $spfstring, $result);
        if (empty($result))
            return "0";
        return $result[0];
    }
}