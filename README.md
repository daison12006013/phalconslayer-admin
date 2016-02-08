# Unstable yet


### Update module.php

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

- Run using `php brood vendor:publish daison_admin --tag=assets`
- Run `bower install` to update all dependencies
