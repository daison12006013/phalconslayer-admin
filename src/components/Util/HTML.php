<?php
namespace Daison\Admin\Components\Util;

class HTML
{
    public static function __callStatic($method, $params)
    {
        $class = ucfirst($method);

        $class_namespace = __NAMESPACE__."\\HTML\\".$class;
        $instance = new $class_namespace($params[0], $params[1]);

        return call_user_func_array([$instance, 'getInstance'], $params);
    }
}