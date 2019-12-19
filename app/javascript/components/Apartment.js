import React from "react";
class Apartment extends React.Component {
  converterNumber = number => {
    return Math.round(number)
      .toString()
      .replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  render() {
    return (
      <div className="apartment-wrapper">
        <div className="image-placeholder">
          <div className="price-wrapper">
            <p className="price">{this.converterNumber(this.props.price)} €</p>
            <p className="price-sqm">
              {this.converterNumber(this.props.price / this.props.sqm)} €/m
              <sup>2</sup>
            </p>
          </div>
        </div>
        <div className="title-wrapper">
          <p>{this.props.title}</p>
        </div>
        <div className="details-wrapper">
          <div className="sqm-wrapper">
            <span className="glyphicon glyphicon-ok-sign icon"></span>
            <p>
              {this.props.sqm} m<sup>2</sup>
            </p>
          </div>
          <div className="bedrooms-wrapper">
            <span className="glyphicon glyphicon-bed icon"></span>
            <p>{this.props.bedrooms} bed</p>
          </div>
          <div className="bathrooms-wrapper">
            <span className="glyphicon glyphicon-tint icon"></span>
            <p>{this.props.bathrooms} tub</p>
          </div>
        </div>
      </div>
    );
  }
}

export default Apartment;
