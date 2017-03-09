<?php

namespace Shopware\Themes\PmTheme;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
PmTheme
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Theme zum Rumspielen
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
pm-florian
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    public function createConfig(Form\Container\TabContainer $container)
    {
    }

    protected $javascript = array('src/js/quantity.js');
}