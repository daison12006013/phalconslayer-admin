<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;
use Clarity\Support\Phalcon\Mvc\Controller as BaseController;

class Controller extends BaseController
{
    protected function getLoggedInUser()
    {
        return Auth::user();
    }
}
