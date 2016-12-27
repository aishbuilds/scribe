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