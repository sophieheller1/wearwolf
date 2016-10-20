// import React, { Component } from 'react';
// import Location from './Location';
// import LocationForm from './LocationForm';
//
// class App extends Component {
//   constructor(props){
//     super(props);
//     this.state = {
//       city_name: '',
//       lat: '',
//       lng: '',
//       // high: null,
//       // low: null,
//       // precipitation: null,
//       // humidity: null,
//       // summary: null
//     }
//     this.handleFormSubmit = this.handleFormSubmit.bind(this);
//     this.handleChange = this.handleChange.bind(this);
//     this.getLocation = this.getLocation.bind(this);
//     // this.getWeather = this.getWeather.bind(this);
//   }
//
//   handleFormSubmit(event) {
//     event.preventDefault();
//     let newLocation = {
//       id: Date.now(),
//       name: this.state.city_name
//     };
//     this.setState({
//       city_name: newLocation.name,
//     })
//     let get_location = this.getLocation(event);
//   }
//
//   handleChange(event) {
//     let newCity = event.target.value;
//     this.setState({ city_name: newCity });
//   }
//
//   getLocation(event) {
//     event.preventDefault();
//     let app = this;
//     let google_key = $('body').data('env')[0];
//     $.ajax({
//       method: 'GET',
//       url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + this.state.city_name + "&key="+ google_key,
//     })
//     .done(data => {
//       app.setState( { lat: data.results[0].geometry.location.lat,
//                     lng: data.results[0].geometry.location.lng })
//     });
//     debugger;
//   }
//
//   // getWeather(event) {
//   //   event.preventDefault();
//   //   let app = this;
//   //   let darksky_key = $('body').data('env')[1];
//   //
//   //   $.ajax({
//   //     method: 'get',
//   //     url: "https://api.darksky.net/forecast/" + darksky_key + "/" + this.state.lat + "," + this.state.lng,
//   //   })
//   //   .done(data => {
//   //     app.setState({ high: daily.data[0]['temperatureMax']})
//   //   });
//   // }
//
//   componentDidMount() {
//
//   }
//
//   render() {
//     return (
//       <div>
//         <h1> Find Weather </h1>
//         <LocationForm
//           handleFormSubmit={this.handleFormSubmit}
//           handleChange={this.handleChange}
//           name={this.state.city_name}
//           // city={this.state.city_name}
//           get_location={this.getLocation}
//           // getWeather={this.getWeather}
//         />
//         <Location
//           city={this.state.city_name}
//           // lat={this.state.lat}
//           // lng={this.state.lng}
//         />
//       </div>
//     );
//   }
// }
//
// export default App;
