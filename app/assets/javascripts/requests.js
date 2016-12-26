$( document ).ready(function() {
    $(".request-confirmation-div").show();
    $("#otp-div").hide();
    $(".message-confirmation-div").hide();
});

function confirmRequest() {
    var phone_no = $("#phone_no").val();
    var data = {phone_no: phone_no};

    $.ajax({
        url:'/otp/send_otp',
        type:'POST',
        dataType:'json',
        data:data,
        success:function(data){
            if (data.status == 200){
                $("#mobile-div").hide();
                $("#otp-div").show();
            }
        },
        error:function(data){
            console.log("yay again ;)");
        }
    });
}

function verifyOtp() {
    var phone_no = $("#phone_no").val();
    var otp = $("#otp").val();
    var data = {phone_no: phone_no, otp: otp};

    $.ajax({
        url:'/otp/verify_otp',
        type:'POST',
        dataType:'json',
        data:data,
        success:function(data){
            if (data.status == 200){
                $(".message-confirmation-div").show();
                $(".request-confirmation-div").hide();
            }
        },
        error:function(data){
            console.log("yay again ;)");
        }
    });
}