import React from 'react';
import ContentCard from './ContentCard';
import Map from '../commons/Map';

function MapCard(props) {
  const header = {
    title: props.title,
    legend: 'Map'
  };

  return (
    <ContentCard header={header} >
      <Map data={props.data} />
    </ContentCard>
  );
}

MapCard.propTypes = {
  /**
   * Define the card title
   */
  title: React.PropTypes.string.isRequired,
  /**
   * Define layers data to the map
   */
  data: React.PropTypes.any.isRequired
};

export default MapCard;