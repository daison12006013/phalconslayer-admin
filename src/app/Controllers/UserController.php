<?php
namespace Daison\Admin\App\Controllers;

use Clarity\Facades\Auth;
use Components\Model\User;

class UserController extends Controller
{
    public function listsAction()
    {
        $users = User::find();

        return view('user.lists')
            ->withLeftNavigation('userLists')
            ->withUser($this->getLoggedInUser())
            ->withUsers($users);
    }
}
