<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Attempt a POST login
     */
    public function loginAction()
    {
        // TODO: check if $_POST has the 'email' and 'password'

        if ( Auth::attempt($_POST) ) {

            return redirect(route('daison_mainRouteManager'));
        }

        return redirect(
                    route('daison_mainRouteManager')
               )
               ->withError('Email or password not mismatch.');
    }

    /**
     * Attempt a POST logout
     */
    public function logoutAction()
    {
        Auth::destroy();

        return redirect(route('daison_mainRouteManager'));
    }
}
