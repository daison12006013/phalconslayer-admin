<?php

Route::addGet('/', [
    'controller' => 'Dashboard',
    'action'     => 'index',
])->setName('daison_mainRouteManager');

Route::addPost('/', [
    'controller' => 'Auth',
    'action' => 'login',
])->setName('daison_postLogin');

Route::addGet('/logout', [
    'controller' => 'Auth',
    'action' => 'logout',
])->setName('daison_postLogout');

Route::addGet('/users', [
    'controller' => 'User',
    'action' => 'lists',
])->setName('daison_showUsers');
