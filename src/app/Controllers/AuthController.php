<?php
namespace Daison\Admin\App\Controllers;

class AuthController extends Controller
{
    /**
     * Attempt a POST login
     */
    public function login()
    {
        $credentials = [
            'email' => request()->get('email'),
            'password' => request()->get('password'),
        ];

        if ( auth()->attempt($credentials) ) {

            if ( request()->has('ref') ) {
                return redirect(request()->get('ref'));
            }

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
    public function logout()
    {
        auth()->destroy();

        return redirect(route('daison_mainRouteManager'));
    }
}
