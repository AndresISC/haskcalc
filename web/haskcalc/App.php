<?php

namespace haskcalc;


class App
{
    var $defaultAction = 'index';
    var $defaultActionPrefix = 'action';

    function __construct()
    {
        $this->response();
    }

    /**
     * Executes the request given the URL, thus thinking in that
     * arr => [
     *  0 => controller
     *  1 => action
     * ]
     */
    private function response()
    {
        $request_uri = substr($_SERVER['REQUEST_URI'], 1);
        $request = explode('/', $request_uri);

        // We go to the default SiteController
        if ($request[0] == '')
            $controller_name = 'SiteController';
        else
            $controller_name = ucfirst($request[0]) . 'Controller';

        $action = isset($request[1]) ? $this->defaultActionPrefix . ucfirst($request[1]) : $this->defaultActionPrefix . ucfirst($this->defaultAction);

        $fqd = '\\haskcalc\\controllers\\' . $controller_name;
        $obj = new $fqd();
        echo call_user_func([$obj, $action]);
    }

}