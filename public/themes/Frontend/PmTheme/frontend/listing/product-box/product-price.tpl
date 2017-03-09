{namespace name="frontend/listing/box_article"}

<div class="product--price">
    {block name='frontend_listing_box_article_price_default'}
        <div>
            <span class="price--default is--nowrap">
                {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}
                {$sArticle.price|currency}
                {s name="Star"}{/s}
            </span>
        </div>
        {if $sArticle.has_pseudoprice}
            <div>
                <span class="price--default is--nowrap pm-price-discount">
                    {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt'}{/s} {/if}
                    bisher {$sArticle.pseudoprice|currency}
                    {s name="Star"}{/s}
                </span>
            </div>
        {/if}
    {/block}
</div>
