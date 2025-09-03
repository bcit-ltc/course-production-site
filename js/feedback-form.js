(function ($) {
    var $feedbackForm = $(".feedback-form form");
    $feedbackForm.submit(function(event) {
        if(!$.trim($('.feedback-form textarea').val())) {
            $(".feedback-form textarea").val('');
            return false;
       }
        $(".input-location").attr("value", window.location.href);
        
        var $form = $(this);
        $.ajax({
            type: $form.attr('method'),
            url: $form.attr('action'),
            data: $form.serialize(),
            statusCode: {
                404: function () {
                    alert("page not found");
                }
            },
            success: function () {
                $(".feedback-form textarea").val('');
                $(".feedback-overlay").show();
                return false;
            }
        });
        event.preventDefault();
    });

    $(".feedback-close-modal").click(function () {
        $(".feedback-overlay").hide();
        return false;
    });
    
    $("#follow-up").on('change', function () {
        if($(this).is(':checked')){
            $(".optional-email").css("visibility", "visible");
            $(".optional-email input").prop({autofocus: true, required: true}).focus();
            
    
        } else {
            $(".optional-email input").removeAttr("autofocus required");
            $(".optional-email").css("visibility", "hidden");
        }
    });
}(jQuery));