import React from "react";
import Apartment from "./Apartment";
import NavBar from "./NavBar";
import Filter from "./Filter";
class Application extends React.Component {
  constructor() {
    super();
    this.state = { apartments: [], showFilter: false };
    this.location = React.createRef();
    this.numberOfBedrooms = React.createRef();
    this.numberOfBathrooms = React.createRef();
    this.priceMin = React.createRef();
    this.priceMax = React.createRef();
    this.sqmMin = React.createRef();
    this.sqmMax = React.createRef();
  }

  fetchData = () => {
    const url =
      window.location.origin +
      "/api/filter?" +
      new URLSearchParams({
        price_gteq: this.priceMin.current.value,
        price_lteq: this.priceMax.current.value,
        sqm_gteq: this.sqmMin.current.value,
        sqm_lteq: this.sqmMax.current.value,
        bedrooms_eq: this.numberOfBedrooms.current.value,
        bathrooms_eq: this.numberOfBathrooms.current.value,
        location: this.location.current.value
      }).toString();

    fetch(url)
      .then(resp => {
        return resp.json();
      })
      .then(data => {
        this.setState({ apartments: data });
      });
  };

  togglFilter = () => {
    this.setState({ showFilter: !this.state.showFilter });
  };

  componentDidMount() {
    fetch(window.location.origin + "/api/filter")
      .then(resp => {
        return resp.json();
      })
      .then(data => {
        this.setState({ apartments: data });
      });
  }

  render() {
    return (
      <div id="homepage-wrapper">
        <NavBar
          location={this.location}
          fetchData={this.fetchData}
          togglFilter={this.togglFilter}
        />
        <Filter
          fetchData={this.fetchData}
          numberOfBedrooms={this.numberOfBedrooms}
          numberOfBathrooms={this.numberOfBathrooms}
          priceMin={this.priceMin}
          priceMax={this.priceMax}
          sqmMin={this.sqmMin}
          sqmMax={this.sqmMax}
          showFilter={this.state.showFilter}
        />
        <div id="apartments-wrapper">
          {this.state.apartments.map(el => (
            <Apartment
              title={el.title}
              sqm={el.sqm}
              bedrooms={el.bedrooms}
              bathrooms={el.bathrooms}
              price={el.price}
              imageUrl={el.image_url}
            />
          ))}
        </div>
      </div>
    );
  }
}

export default Application;
