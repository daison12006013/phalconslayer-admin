<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;

class DashboardController extends Controller
{
    public function indexAction()
    {
        if ( Auth::check() ) {

            return view('dashboard.index')
                   ->withLeftNavigation('dashboard');
        }

        return view('auth.login');
    }
}
