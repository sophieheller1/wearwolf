import React from 'react';

const Location = props => {

  return (
    <div className="location-box">
      <ul>
        <li> Name: {props.name} </li>
      </ul>
    </div>
  );
};

export default Location;
