<?php
namespace Daison\Admin\App\Controllers;

class DashboardController extends Controller
{
    public function index()
    {
        if ( auth()->check() ) {

            return view('dashboard.index')
                   ->withLeftNavigation('dashboard');
        }

        return view('auth.login');
    }
}
