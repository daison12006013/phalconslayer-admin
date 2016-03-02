<?php
namespace Daison\Admin;

use Phalcon\Di\FactoryDefault;
use Clarity\Providers\ServiceProvider;

class AdminServiceProvider extends ServiceProvider
{
    protected $alias = 'daison_admin';
    protected $shared = true;

    public function getViewsDir()
    {
        return __DIR__.'/resources/views';
    }

    public function getLangDir()
    {
        return __DIR__.'/resources/lang';
    }

    /**
     * {@inheritdoc}
     */
    public function boot()
    {
        $this->publish([
            __DIR__.'/resources/views' => base_path('resources/views/vendor/daisonAdmin'),
        ], 'view');

        $this->publish([
            __DIR__.'/resources/lang' => base_path('resources/lang/vendor/daisonAdmin'),
        ], 'lang');

        $this->publish([
            __DIR__.'/assets' => base_path('public/vendor/daisonAdmin'),
        ], 'asset');

        $this->publish([
            __DIR__.'/database/migrations' => base_path('database/migrations'),
        ], 'migration');

        $this->publish([
            __DIR__.'/dist' => base_path(),
        ], 'dist');
    }

    /**
     * Get the configuration
     *
     * @return mixed
     */
    private function getClosure()
    {
        $self = $this;

        return function (FactoryDefault $di) use ($self) {

            $lang_dir  = $self->getLangDir();
            $views_dir = $self->getViewsDir();

            $base_lang_dir  = base_path('resources/lang/vendor/daisonAdmin');
            $base_views_dir = base_path('resources/views/vendor/daisonAdmin');

            if ( is_dir($base_views_dir) ) {
                $views_dir = $base_views_dir;
            }

            if ( is_dir($base_lang_dir) ) {
                $lang_dir = $base_lang_dir;
            }

            $di->get('view')->setViewsDir($views_dir);
            $di->get('lang')->setLangDir($lang_dir);

            $di->get('dispatcher')->setDefaultNamespace('Daison\Admin\App\Controllers');
        };
    }

    /**
     * {@inheritdoc}
     *
     * @return mixed return this class itself
     */
    public function register()
    {
        require __DIR__ . '/app/routes.php';

        di()->get('module')->setModule($this->alias, $this->getClosure());

        return $this;
    }
}
