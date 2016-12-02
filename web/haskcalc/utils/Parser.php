<?php
/**
 * Created by IntelliJ IDEA.
 * User: apex
 * Date: 1/12/16
 * Time: 21:14
 */

namespace haskcalc\utils;


class Parser
{
    public static function parseEquation($eqString)
    {
        $split = preg_split('/(\+)|(-)|(\/)|(x)|(\^)/', $eqString, -1, PREG_SPLIT_DELIM_CAPTURE);
        $filter = array_filter($split, function ($value){
            return $value != "";
        });
        $parsing = array_values($filter);
        return $parsing;
    }

    public static function parseTrigonometric($eqString)
    {
        $parsing = array_values(array_filter(preg_split('/(sin)|(cos)|(tan)|(ctg)|(sec)|(csc)/', $eqString, -1, PREG_SPLIT_DELIM_CAPTURE)));
        return $parsing;
    }
}