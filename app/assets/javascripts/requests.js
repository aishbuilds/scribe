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

function verifyOtp(request_id) {
    var phone_no = $("#phone_no").val();
    var otp = $("#otp").val();
    var request_id = $("#request_id").val();

    var data = {phone_no: phone_no, otp: otp, request_id: request_id};
    $.ajax({
        url:'/requests/confirm',
        type:'POST',
        dataType:'json',
        data:data,
        success:function(data){
            if (data.status == 200){
                $(".message-confirmation-div").show();
                if(data.priority == 1){
                    $("#backup").hide();
                    $("#confirmed").show();
                }else{
                    $("#confirmed").hide();
                    $("#backup").show();
                }

                $(".request-confirmation-div").hide();
            }
        },
        error:function(data){
            console.log("yay again ;)");
        }
    });
}