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

    private function _getUser($id)
    {
        $user = User::findFirst($id);

        if ( $user === false ) {
            return redirect(route('daison_showUsers'))
                   ->withError("User id [$id] not found.");
        }

        return $user;
    }

    public function viewAction($id)
    {
        return view('user.view')->withTargetUser($this->_getUser($id));
    }

    public function editAction($id)
    {
        return view('user.edit')->withTargetUser($this->_getUser($id));
    }
}
