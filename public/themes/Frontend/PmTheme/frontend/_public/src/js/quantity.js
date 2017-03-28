/**
 * Created by florian on 09.03.17.
 */

(function($){
    $(document).ready(function() {
       $('.pm-quantity-minus').click(function(event) {
           console.log("-", $(event.currentTarget).parent());
       });

       $('.pm-quantity-plus').click(function() {
           console.log("+");
       });
    });
})(jQuery);