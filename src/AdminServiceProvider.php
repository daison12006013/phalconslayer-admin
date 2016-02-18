<?php
namespace Daison\Admin;

use Clarity\Providers\ServiceProvider;

class AdminServiceProvider extends ServiceProvider
{
    protected $alias = 'daison_admin';
    protected $shared = false;

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
    }

    /**
     * {@inheritdoc}
     *
     * @return mixed return this class itself
     */
    public function register()
    {
        require __DIR__ . '/app/routes.php';

        return $this;
    }
}
