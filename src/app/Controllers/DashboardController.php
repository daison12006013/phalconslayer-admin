<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;
use Clarity\Facades\View;

class DashboardController extends Controller
{
    public function indexAction()
    {
        if ( Auth::check() ) {

            return View::make('dashboard.index')
                ->withLeftNavigation('dashboard')
                ->withUser($this->getLoggedInUser());
        }

        return View::make('auth.login');
    }
}
