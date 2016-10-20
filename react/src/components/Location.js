import React from 'react';

const Location = props => {
  let location = props.city_name

  return (
    <div className="location-box">
      <ul>
        <li> Name: {location} </li>
      </ul>
    </div>
  );
};

export default Location;
