import React from "react";
import PropTypes from "prop-types";
class Filter extends React.Component {
  render() {
    return (
      <div className="filters-form">
        <p onClick={this.props.fetchData}>KLICK ME!!!</p>
        <p>
          Bedrooms:{" "}
          <input
            id="numberOfBedrooms"
            type="number"
            name="numberOfBedrooms"
            min="0"
            max="5"
            ref={this.props.numberOfBedrooms}
          ></input>
        </p>
        <p>
          Bathrooms:{" "}
          <input
            id="numberOfBathrooms"
            type="number"
            name="numberOfBathrooms"
            min="1"
            max="3"
            ref={this.props.numberOfBathrooms}
          ></input>
        </p>
        <p>
          Price min:{" "}
          <input
            id="priceMin"
            type="number"
            name="priceMin"
            min="0"
            ref={this.props.priceMin}
          ></input>
        </p>
        <p>
          Price max:{" "}
          <input
            id="priceMax"
            type="number"
            name="priceMax"
            min="0"
            ref={this.props.priceMax}
          ></input>
        </p>
        <p>
          Sqm min:{" "}
          <input
            id="sqmMin"
            type="number"
            name="sqmMin"
            min="0"
            ref={this.props.sqmMin}
          ></input>
        </p>
        <p>
          Sqm max:{" "}
          <input
            id="sqmMax"
            type="number"
            name="sqmMax"
            min="0"
            ref={this.props.sqmMax}
          ></input>
        </p>
      </div>
    );
  }
}

Filter.propTypes = {
  greeting: PropTypes.string
};

export default Filter;
