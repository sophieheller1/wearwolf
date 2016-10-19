$(document).ready(function() {

  $('.location-search').on('click', function(event){
    event.preventDefault();
    var city = $('.search-form').val();
    var google_key = $('body').data('env')[0];


    var get_location = $.ajax({
      method: "get",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + city + "&key="+ google_key,
    });

    get_location.done(function(data){
      var lat = data.results[0]['geometry']['location']['lat'];
      $('.current-location').replaceWith(city);
      var lng = data.results[0]['geometry']['location']['lng'];
      var darksky_key = $('body').data('env')[1];


      var get_weather = $.ajax({
        method: "get",
        url: "https://api.darksky.net/forecast/" + darksky_key + "/" + lat + "," + lng,
      });

      get_weather.done(function(data){
        var high = data.daily.data[0]['temperatureMax'];
        var low = data.daily.data[0]['temperatureMin'];
        var precipitation = data.daily.data[0]['precipProbability'];
        precipitation = Math.round((precipitation * 100));
        var humidity = Math.round((humidity * 100));
        var summary = data.daily.data[0]['summary'];
        console.log(humidity);

        $('#high').replaceWith(high);
        $('#low').replaceWith(low);
        $('#precipitation').replaceWith(precipitation);
        $('#humidity').replaceWith(humidity);
        $('#summary').replaceWith(summary);
      })

      // maybe a separate button for show what to wear (can remove button if things make more sense)
    });
  });





});
