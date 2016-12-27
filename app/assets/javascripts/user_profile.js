function fetchCities() {
    $.ajax({
        url:'/../cities',
        type:'GET',
        dataType:'json',
        success:function(data){
            $( "#q3" ).autocomplete({
                source: data.cities
            });
        },
        error:function(data){
            console.log("oh no! try again ;)");
        }
    });
}

function fetchLocalities() {
    $.ajax({
        url:'/../localities',
        type:'GET',
        dataType:'json',
        success:function(data){
            $( "#q4" ).autocomplete({
                source: data.localities
            });
        },
        error:function(data){
            console.log("oh no! try again ;)");
        }
    });
}

function submitUserDetails(){
    var name = $("#q1").val();
    var phone_no = $("#q2").val();
    var user_id = $("#user_id").val();
    var cities = $("#q3").val();
    var localities = $("#q4").val();

    var data = {user_detail: {name: name, phone_no: phone_no, user_id: user_id, cities: cities, localities: localities}}
    $.ajax({
        url:'/../user_details',
        type:'POST',
        dataType:'json',
        data: data,
        success:function(data){
            console.log
        },
        error:function(data){
            console.log("oh no! try again ;)");
        }
    });
}