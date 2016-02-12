<?php
namespace Daison\Admin\Components\Middleware;

class Auth implements \League\Tactician\Middleware
{
    public function execute($command, callable $next)
    {
        if ( auth()->check() === false ) {

            flash_bag()->error('Please login to access this page.');

            redirect(

                url(
                    route('daison_mainRouteManager'),
                    [
                        'ref' => url()->current()
                    ]
                )
            );
        }

        return $next($command);
    }
}
