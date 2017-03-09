{extends file="parent:frontend/index/shop-navigation.tpl"}

{block name='frontend_index_checkout_actions'}
    <li class="navigation--entry">
        <a href="" class="btn starButton"> {* Add an URL to the href attribute to make your link work *}
            <i class="icon--star"></i>
        </a>
    </li>

    {$smarty.block.parent}
{/block}