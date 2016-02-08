<?php
namespace Daison\Admin\App\Controllers;

use Components\Model\User;

class UserController extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->view->setVar('left_navigation', 'userLists');
    }

    public function listsAction()
    {
        $users = User::find();

        return view('user.lists')
               ->withUsers($users);
    }

    public function editAction($id)
    {
        $user = User::find($id);

        if ( $user->count() === 0 ) {
            return redirect(route('daison_showUsers'))
                   ->withError("User id [$id] not found.");
        }

        return view('user.edit')
               ->withTargetUser($user);
    }
}
