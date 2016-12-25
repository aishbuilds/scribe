$( document ).ready(function() {
    $("#otp-div").hide();
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