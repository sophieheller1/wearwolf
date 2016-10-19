

$(document).ready(function() {

  $('.location-search').on('click', function(event){
    event.preventDefault();
    var city = $('.search-form').val();
    var google_key = $('body').data('env');

    var get_location = $.ajax({
      method: "get",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + city + "&key="+ google_key,
    });

    get_location.done(function(data){
      var lat = data.results[0]['geometry']['location']['lat']
      var long = data.results[0]['geometry']['location']['long']

      
      // save variables and parse them in function
      // put city on page, like the weather in Boston is
      // maybe a separate button for show what to wear (can remove button if things make more sense)
    });
  });





});
