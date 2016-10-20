$(document).ready(function() {
  $('.add-location').on('click', function(event){
    event.preventDefault();
    var zip = $('#zip-search').val();
    debugger;
    var google_key = $('body').data('env')[0];

    var get_coordinates = $.ajax({
      method: "get",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + zip + "&key="+ google_key,
    });

    get_coordinates.done(function(data){
      var city = $('.city-search').val();
      var state = $('.state-search').val();
      var zip = $('.zip-search').val();
      var country = $('.country-search').val();
      var lat = data.results[0]['geometry']['location']['lat'];
      var lng = data.results[0]['geometry']['location']['lng'];

      var save_location = $.ajax({
        method: "post",
        data: { city: city, state: state, zip: zip, country: country, latitude: lat, longitude: lng },
        url: '/locations/`$(location)`'
      })


      // var get_weather = $.ajax({
      //   method: "get",
      //   url: "https://api.darksky.net/forecast/" + darksky_key + "/" + lat + "," + lng,
      // });
      //
      // get_weather.done(function(data){
      //   var high = data.daily.data[0]['temperatureMax'];
      //   var low = data.daily.data[0]['temperatureMin'];
      //   var precipitation = data.daily.data[0]['precipProbability'];
      //   precipitation = Math.round((precipitation * 100));
      //   var humidity = Math.round((humidity * 100));
      //   var summary = data.daily.data[0]['summary'];
      //   console.log(humidity);

        // $('#high').replaceWith(high);
        // $('#low').replaceWith(low);
        // $('#precipitation').replaceWith(precipitation);
        // $('#humidity').replaceWith(humidity);
        // $('#summary').replaceWith(summary);

      //   var save_weather = $.ajax({
      //     method: "post",
      //     data: { maxtemp: high, mintemp: low, precipitation: precipitation,
      //           humidity: humidity, description: summary }
      //     url: "/conditions/condition"
      //   })
      // })

      // maybe a separate button for show what to wear (can remove button if things make more sense)
    });
  });





});
