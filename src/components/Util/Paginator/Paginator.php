<?php
namespace Daison\Admin\Components\Util\Paginator;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Paginator
{
    private $paginator;

    public function __construct($model, $options)
    {
        $this->paginator = new PaginatorModel([
            'data'  => $model,
            'limit' => isset($options['limit']) ? $options['limit'] : 10,
            'page'  => isset($_GET['page']) ? (int) $_GET['page'] : 1,
        ]);
    }

    public static function make($model, $options)
    {
        return new self($model, $options);
    }

    public function items()
    {
        return $this->paginator->getPaginate()->items;
    }

    private function currentUrlChangePageNum($page_num)
    {
        $parts = parse_url(url()->current());

        if ( isset($parts['query']) === false ) {

            return url()->get(
                url()->current(),
                [
                    'page' => $page_num,
                ]
            );
        }

        parse_str($parts['query'], $query);

        $base_url = $parts['scheme'].'://'.$parts['host'].$parts['path'];
        $query['page'] = $page_num;

        return url()->get($base_url.'?'.http_build_query($query));
    }

    public function render()
    {
        $lis = '';

        $page = $this->paginator->getPaginate();

        $lis .= '<li><a href="'.$this->currentUrlChangePageNum($page->current).'">'.$page->current.'</a></li>';
        $lis .= '<li><a href="'.$this->currentUrlChangePageNum($page->next).'">'.$page->next.'</a></li>';

        for ($i = ($page->next + 1); $i < $page->last; $i++) {
            $lis .= '<li><a href="'.$this->currentUrlChangePageNum($i).'">'.$i.'</a></li>';
        }

        $lis .= '<li><a href="'.$this->currentUrlChangePageNum($page->last).'">'.$page->last.'</a></li>';

        echo <<<EOT
<ul class="pagination">
    <li>
        <a href="#" aria-label="First">
            <span aria-hidden="true">«</span>
        </a>
    </li>
    $lis
    <li>
        <a href="#" aria-label="Last">
            <span aria-hidden="true">»</span>
        </a>
    </li>
</ul>
EOT;
    }
}