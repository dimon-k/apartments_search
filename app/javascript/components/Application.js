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
    const location = this.location.current;
    const numberOfBedrooms = this.numberOfBedrooms.current;
    const numberOfBathrooms = this.numberOfBathrooms.current;
    const priceMin = this.priceMin.current;
    const priceMax = this.priceMax.current;
    const sqmMin = this.sqmMin.current;
    const sqmMax = this.sqmMax.current;
    const url =
      window.location.origin +
      "/api/filter?" +
      new URLSearchParams({
        location: location.value,
        bedrooms: numberOfBedrooms.value,
        bathrooms: numberOfBathrooms.value,
        price_min: priceMin.value,
        price_max: priceMax.value,
        sqm_min: sqmMin.value,
        sqm_max: sqmMax.value
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
    fetch(window.location.origin + "/api/filter?")
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
            />
          ))}
        </div>
      </div>
    );
  }
}

export default Application;
