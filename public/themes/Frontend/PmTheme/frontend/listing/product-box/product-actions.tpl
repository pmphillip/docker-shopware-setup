{extends file="parent:frontend/listing/product-box/product-actions.tpl"}

{* Product actions *}
{block name='frontend_listing_box_article_actions_content'}
    <div class="product--actions pm-product-actions">

        {* Note button *}
        {block name='frontend_listing_box_article_actions_save'}
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post" class="pm-full-border  pm-action-item-secondary pm-action-form-small">
                <button type="submit"
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="product--action action--note pm-item"
                   data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--check"></i> <span class="action--text"></span>
                </button>
            </form>
        {/block}

        {* Amount buttons *}
        {block name='frontend_listing_box_article_actions_set_amount'}
            <form class="pm-full-border pm-action-form-big">
                <button 
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="product--action action--decrease pm-item pm-inactive"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--minus"></i> <span class="action--text"></span>
                </button>
                <input class="pm-box-input" value="1" type="numeric"></input>
                <button 
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="product--action action--increase pm-item pm-active"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--plus"></i> <span class="action--text"></span>
                </button>
            </form>
        {/block}

        {* Add to cart button *}
        {block name='frontend_listing_box_article_actions_add_to_cart'}
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post" class="pm-full-border pm-action-item-primary pm-action-form-small">
                <button type="submit"
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="product--action action--note pm-item"
                   data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--basket"></i> <span class="action--text"></span>
                </button>
            </form>
        {/block}
    </div>
{/block}
