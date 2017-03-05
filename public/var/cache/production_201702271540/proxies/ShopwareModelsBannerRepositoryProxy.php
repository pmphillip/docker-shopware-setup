<?php
class Shopware_Proxies_ShopwareModelsBannerRepositoryProxy extends Shopware\Models\Banner\Repository implements Enlight_Hook_Proxy
{
    public function executeParent($method, $args = array())
    {
        return call_user_func_array(array($this, 'parent::' . $method), $args);
    }

    public static function getHookMethods()
    {
        return array ();
    }
    
}
