<?php
namespace Daison\Admin\Components\Util\Paginator;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Paginator
{
    private $options;
    private $paginator;

    public function __construct($model, $options)
    {
        $this->options = $options;

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

    public function total_items()
    {
        return $this->paginator->getPaginate()->total_items;
    }

    public function items()
    {
        return $this->paginator->getPaginate()->items;
    }

    private function urlToPage($page_num)
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

    public static function sanitize($total_items, $current_page, $last_page, $limit, $adjacents = 5)
    {
        if ( ($sub_adj = ceil($total_items / $limit)) < $adjacents ) {
            $adjacents = $sub_adj;
        }

        $pages = [];
        $half_adj = floor($adjacents/2);

        # first page
        if ($current_page <= 1) {

            for ($i = 1; $i <= $adjacents; $i++) {
                $pages[] = number_format($i);
            }
        }

        # last page
        elseif ($current_page >= $last_page) {

            for ($i = ($last_page - $adjacents + 1); $i <= $last_page; $i++) {

                $pages[] = number_format($i);

                if ( $i === $last_page ) {
                    break;
                }
            }
        }

        else {

            $left = (int) $current_page - $half_adj;
            $right = (int) $current_page + $half_adj;

            $left_gap = $current_page - 1;
            $right_gap = $last_page - $current_page;

            if ($left >= 1 && $right <= $last_page) {

                for ($i = $left; $i <= $right; $i++) {
                    $pages[] = number_format($i);
                }
            }

            elseif ($left_gap < $right_gap) {

                for ($i = 1; $i <= $adjacents; $i++) {
                    $pages[] = number_format($i);
                }
            }

            elseif ($left_gap > $right_gap) {

                for ($i = ($last_page - $adjacents + 1); $i <= $last_page; $i++ ) {
                    $pages[] = number_format($i);
                }
            }
        }

        return $pages;
    }

    public function render()
    {
        $lis = '';
        $page = $this->paginator->getPaginate();

        $first_page = $this->urlToPage(1);
        $last_page = $this->urlToPage($page->last);

        $page_numbers = static::sanitize(
            $page->total_items,
            $page->current,
            $page->last,
            $this->options['limit'],
            5
        );

        foreach ($page_numbers as $num) {

            if ($page->current == $num) {
                $lis .= '<li class="active"><a href="'.$this->urlToPage($page->current).'">'.$page->current.'</a></li>';

                continue;
            }

            $lis .= '<li><a href="'.$this->urlToPage($num).'">'.$num.'</a></li>';
        }

        echo <<<EOT
<ul class="pagination">
    <li>
        <a href="$first_page" aria-label="First">
            <span aria-hidden="true">«</span>
        </a>
    </li>
    $lis
    <li>
        <a href="$last_page" aria-label="Last">
            <span aria-hidden="true">»</span>
        </a>
    </li>
</ul>
EOT;
    }
}