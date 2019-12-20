import React from "react";
import PropTypes from "prop-types";
class Filter extends React.Component {
  render() {
    return (
      <div
        className="filters-form"
        style={{ display: this.props.showFilter ? "block" : "none" }}
      >
        <div className="price-filter-wrapper">
          <p className="price-filter-title">PRICE:</p>
          <input
            id="priceMin"
            type="number"
            name="priceMin"
            min="0"
            ref={this.props.priceMin}
            className="w3-input w3-border w3-round filter-min"
            placeholder="min"
          ></input>
          <input
            id="priceMax"
            type="number"
            name="priceMax"
            min="0"
            ref={this.props.priceMax}
            className="w3-input w3-border w3-round filter-max"
            placeholder="max"
          ></input>
        </div>
        <div className="sqm-filter-wrapper">
          <p className="sqm-filter-title">SQM:</p>
          <input
            id="sqmMin"
            type="number"
            name="sqmMin"
            min="0"
            ref={this.props.sqmMin}
            className="w3-input w3-border w3-round filter-min"
            placeholder="min"
          ></input>
          <input
            id="sqmMax"
            type="number"
            name="sqmMax"
            min="0"
            ref={this.props.sqmMax}
            className="w3-input w3-border w3-round filter-max"
            placeholder="max"
          ></input>
        </div>
        <div className="rooms-wrapper">
          <p className="rooms-title">Bedrooms: </p>
          <input
            id="numberOfBedrooms"
            type="number"
            name="numberOfBedrooms"
            min="0"
            max="5"
            maxLength="1"
            ref={this.props.numberOfBedrooms}
            className="w3-input w3-border w3-round rooms-input"
          ></input>

          <p className="rooms-title">Bathrooms: </p>
          <input
            id="numberOfBathrooms"
            type="number"
            name="numberOfBathrooms"
            min="1"
            max="3"
            maxLength="1"
            ref={this.props.numberOfBathrooms}
            className="w3-input w3-border w3-round rooms-input"
          ></input>

          <button className="apply-magnifier" onClick={this.props.fetchData}>
            APPLY
          </button>
        </div>
      </div>
    );
  }
}

Filter.propTypes = {
  greeting: PropTypes.string
};

export default Filter;
