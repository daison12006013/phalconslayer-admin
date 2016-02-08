<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;
use Clarity\Facades\View;
use Clarity\Support\Phalcon\Mvc\Controller as BaseController;

class Controller extends BaseController
{
    public function initialize()
    {
        if ( Auth::check() ) {
            view()->setVar('user', Auth::user());
        }
    }
}
