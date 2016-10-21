$(document).ready(function() {
  $('.get-weather').on('click', function(event){
    event.preventDefault();

    var google_key = $('body').data('env')[0];
    var zip = $('#zip').html();

    var get_coordinates = $.ajax({
      method: "get",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + zip + "&key="+ google_key,
    });


    get_coordinates.done(function(data){
      var lat  = data.results[0]['geometry']['location']['lat'];
      var lng = data.results[0]['geometry']['location']['lng'];
      var darksky_key = $('body').data('env')[1];
      $('.get-weather').hide();

      var get_weather = $.ajax({
        method: "get",
        dataType: "jsonp",
        url: "https://api.darksky.net/forecast/" + darksky_key + "/" + lat + "," + lng,
      });

      get_weather.done(function(data){
        var high = data.daily.data[0]['temperatureMax'];
        var low = data.daily.data[0]['temperatureMin'];
        var precipitation = data.daily.data[0]['precipProbability'];
        precipitation = Math.round((precipitation * 100));
        var humidity = data.daily.data[0]['humidity'];
        humidity = Math.round((humidity * 100));
        var summary = data.daily.data[0]['summary'];
        $('.high').append('High: ' + high);
        $('.low').append('Low: ' + low);
        $('.precipitation').append('Precipitation: ' + precipitation + '%');
        $('.humidity').append('Humidity: ' + humidity + '%');
        $('.summary').append(summary);


        var save_weather = $.ajax({
          method: "post",
          url: '/api/v1/conditions',
          data: { maxtemp: high, mintemp: low, precipitation: precipitation,
                  humidity: humidity, description: summary }
        });

        save_weather.done(function(data){
          alert("Hold tight");
        });

    });
  });
});
});
