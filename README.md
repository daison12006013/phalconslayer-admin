# Phalcon Slayer Admin

This package supports the [Slayer Framework](http://github.com/phalconslayer/slayer), this also helps and test the components and features that might be encountered later on.

Help us to improve this package by submitting a PR, or submitting any issues or new features that you might want to be added.


### Update app/modules.php

```
    'daison_admin' => function (Phalcon\Di\FactoryDefault $di) {
        $admin = $di->get('daison_admin');

        $views_dir = $admin->getViewsDir();
        $lang_dir = $admin->getLangDir();

        $base_views_dir = base_path('resources/views/vendor/daisonAdmin');
        $base_lang_dir = base_path('resources/lang/vendor/daisonAdmin');

        if ( is_dir($base_views_dir) ) {
            $views_dir = $base_views_dir;
        }

        if ( is_dir($base_lang_dir) ) {
            $lang_dir = $base_lang_dir;
        }

        $di->get('view')->setViewsDir($views_dir);
        $di->get('lang')->setLangDir($lang_dir);

        $di->get('dispatcher')->setDefaultNamespace('Daison\Admin\App\Controllers');
    },
```

### Update config/app.php

```
    'ssl' => [
        'daison_admin' => false,
    ],


    'base_uri' => [
        'daison_admin' => 'slayeradmin.app',
    ],
```


### Publish the assets


1. Run using `php brood vendor:publish daison_admin --tag=assets`

    - After running the publish command, go to <root>/public/vendor/daisonAdmin/

2. Run `bower install` to update all dependencies

    - Make sure you have a bower on your system

----

I'm accepting any PR's or any Issues.

# FYI: this project is still ongoing.