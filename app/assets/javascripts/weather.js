$(document).ready(function () {
  


});







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

  var save_weather = $.ajax({
    method: "post",
    data: { maxtemp: high, mintemp: low, precipitation: precipitation,
          humidity: humidity, description: summary }
    url: "/conditions/condition"
  })
})
