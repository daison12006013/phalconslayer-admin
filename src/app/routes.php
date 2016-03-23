<?php

Route::addGet('/', [
        'controller' => 'Dashboard',
        'action'     => 'index',
])
->setName('daison_mainRouteManager');


Route::addPost('/', [
        'controller' => 'Auth',
        'action'     => 'login',
])
->setName('daison_postLogin');


Route::addGet('/logout', [
        'controller' => 'Auth',
        'action'     => 'logout',
])
->setName('daison_postLogout');


 Route::addGet('/users', [
         'controller' => 'User',
         'action'     => 'lists',
 ])
 ->setName('daison_showUsers');


 Route::addGet('/users/{id}/view', [
         'controller' => 'User',
         'action'     => 'view',
 ])
 ->setName('daison_viewUser');


 Route::addGet('/users/{id}/edit', [
         'controller' => 'User',
         'action'     => 'edit',
 ])
 ->setName('daison_editUser');


 Route::add('/users/{id}/delete', [
         'controller' => 'User',
         'action'     => 'delete',
 ])
 ->setName('daison_deleteUser');


 Route::add(
     '/users/{id}/resend-confirmation',
     [
         'controller' => 'User',
         'action'     => 'resendConfirmation'
     ]
 )
 ->setName('daison_resendConfirmationUser');


//Route::add(
//    '/{resource}',
//    [
//        'controller' => 'Dynamic',
//        'action'     => 'index',
//    ]
//);
//
//Route::add(
//    '/{resource}/{id}/view',
//    [
//        'controller' => 'Dynamic',
//        'action'     => 'view',
//    ]
//);
//
//Route::add(
//    '/{resource}/{id}/edit',
//    [
//        'controller' => 'Dynamic',
//        'action'     => 'edit',
//    ]
//);
//
//Route::add(
//    '/{resource}/{id}/delete',
//    [
//        'controller' => 'Dynamic',
//        'action'     => 'delete',
//    ]
//);
