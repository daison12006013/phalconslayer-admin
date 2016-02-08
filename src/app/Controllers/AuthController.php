<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\URL;
use Clarity\Facades\Auth;
use Clarity\Facades\Redirect;

class AuthController extends Controller
{
    public function loginAction()
    {
        if ( Auth::attempt($_POST) ) {

            return Redirect::to(URL::route('daison_mainRouteManager'));
        }

        return Redirect::to(URL::route('daison_mainRouteManager'))
            ->withError('Email or password not mismatch.');
    }

    public function logoutAction()
    {
        Auth::destroy();

        return Redirect::to(URL::route('daison_mainRouteManager'));
    }
}
