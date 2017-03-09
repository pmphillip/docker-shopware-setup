{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* dont show badges *}
{block name='frontend_listing_box_article_badges'}
{/block}

{block name='frontend_listing_box_article_info_container'}
    <div class="product--info pm-product--info">

        {* Product image *}
        {block name='frontend_listing_box_article_picture'}
            {include file="frontend/listing/product-box/product-image.tpl"}
        {/block}


	        {* Product name *}
	        {block name='frontend_listing_box_article_name'}
	            <a href="{$sArticle.linkDetails}"
	               class="product--title pm-product--title"
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

	        {* Product actions - Compare product, more information, buy now *}
	        {block name='frontend_listing_box_article_actions'}
	            {include file="frontend/listing/product-box/product-actions.tpl"}
	        {/block}
    </div>
{/block}