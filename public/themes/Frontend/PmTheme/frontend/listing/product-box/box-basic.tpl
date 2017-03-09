{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    <div class="product--box box--{$productBoxLayout}"
         data-page-index="{$pageIndex}"
         data-ordernumber="{$sArticle.ordernumber}"
         {if !{config name=disableArticleNavigation}} data-category-id="{$sCategoryCurrent}"{/if}>

        {block name="frontend_listing_box_article_content"}
            <div class="box--content is--rounded">

                {block name='frontend_listing_box_article_badges'}{/block}

                {block name='frontend_listing_box_article_info_container'}
                    <div class="pm-article-image">
                        {block name='frontend_listing_box_article_picture'}
                            {include file="frontend/listing/product-box/product-image.tpl"}
                        {/block}
                    </div>
                    <div>
                        {* Product name *}
                        {block name='frontend_listing_box_article_name'}
                            <a href="{$sArticle.linkDetails}"
                               class="product--title"
                               title="{$sArticle.articleName|escapeHtml}">
                                {$sArticle.articleName|truncate:50|escapeHtml}
                            </a>
                        {/block}
                        {block name='frontend_listing_box_article_price_info'}
                            <div class="product--price-info">
                                {* Product price - Unit price *}
                                {block name='frontend_listing_box_article_unit'}
                                    {include file="frontend/listing/product-box/product-price-unit.tpl"}
                                {/block}
                                {* Product price - Default and discount price *}
                                {block name='frontend_listing_box_article_price'}
                                    {include file="frontend/listing/product-box/product-price.tpl"}
                                {/block}
                            </div>
                        {/block}
                    </div>
                    <div class="pm-article-actions-wrapper">
                        {* Product actions *}
                        {block name='frontend_listing_box_article_actions'}
                            {include file="frontend/listing/product-box/product-actions.tpl"}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}
