<?php
namespace Daison\Admin\App\Controllers;

use Daison\Admin\Components\Util\HTML as h;

class DynamicController extends Controller
{
    private $page;

    public function initialize()
    {
        parent::initialize();
    }

    private function callResource($resource)
    {
        h::table(
            [
                'table' => 'users',

                'fields' => [
                    'id'           => 'ID',
                    'email'        => 'Email',
                    'name'         => 'Name',
                    'created_at'   => 'Created At',
                    'is_activated' => 'Activated',
                ],

                'types' => [
                    'id'         => 'int',
                    'email'      => 'str',
                    'name'       => 'str',
                    'activated'  => 'int',
                    'created_at' => 'date(Y-m-d)',
                ],

                'search' => [
                    'id'           => true,
                    'email'        => true,
                    'name'         => true,
                    'created_at'   => true,
                    'is_activated' => true,
                ],

                'edit' => [
                    'id'           => false,
                    'email'        => 'email',
                    'name'         => 'text',
                    'created_at'   => 'date',
                    'is_activated' => [1 => 'Yes', 0 => 'No'],
                ],

                'enable_edit'     => true,
                'enable_search'   => true,
                'enable_delete'   => true,
                'enable_refresh'  => true,
                'enable_download' => true,
            ],
            [
                'delete' => [
                    'single'   => 'Please confirm if you want to delete the account of {name} the email is {email}?',
                    'multiple' => 'Are you sure you want to delete those selected accounts?',
                ],
            ]
        );
    }

    public function index($resource)
    {
        $ret = $this->callResource($resource);
    }

    public function view($resource, $id)
    {
        $ret = $this->callResource($resource);
    }

    public function edit($resource, $id)
    {
        $ret = $this->callResource($resource);
    }

    public function delete($resource, $id)
    {
        $ret = $this->callResource($resource);
    }
}
