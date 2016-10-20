import React from 'react';

const LocationForm = props => {
  return(
    <form onSubmit={props.handleFormSubmit}>
      <input type="text"
      placeholder="Enter city"
      value={props.city_name}
      onChange={props.handleChange}
      />
      <input type="submit" value="Get weather" />
    </form>
  );
};

export default LocationForm;
