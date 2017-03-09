{namespace name="frontend/listing/box_article"}

{* Product actions *}
{block name='frontend_listing_box_article_actions_content'}
    <div class="product--actions">
        {* Note button *}
        {block name='frontend_listing_box_article_actions_save'}
            <form class="pm-float-left" action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post">
                <button type="submit"
                        title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                        class="product--action action--note"
                        data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                        data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--check"></i>
                </button>
            </form>
        {/block}

        {block name='frontend_listing_box_article_actions_quantity'}
            <div class="pm-quantity-wrapper pm-float-left">
                <form>
                    <div class="pm-quantity-input">
                        <input type="number" min="1" max="99" value="1"/>
                    </div>
                </form>
            </div>
        {/block}

        {block name='frontend_listing_box_article_actions_cart'}
            <form action="{url controller='checkout' action='ajaxAddArticleCart'}" method="post">
                <button type="submit" class="pm-cart-wrapper pm-float-left">
                    <i class="icon--basket"></i>
                </button>
            </form>
        {/block}
    </div>
{/block}
