import React from "react";
import Apartment from "./Apartment";
import NavBar from "./NavBar";
import Filter from "./Filter";
class HomePage extends React.Component {
  constructor() {
    super();
    this.state = { apartments: [] };
    this.numberOfBedrooms = React.createRef();
    this.numberOfBathrooms = React.createRef();
    this.priceMin = React.createRef();
    this.priceMax = React.createRef();
    this.sqmMin = React.createRef();
    this.sqmMax = React.createRef();
  }

  fetchData = () => {
    var numberOfBedrooms = this.numberOfBedrooms.current;
    var numberOfBathrooms = this.numberOfBathrooms.current;
    var priceMin = this.priceMin.current;
    var priceMax = this.priceMax.current;
    var sqmMin = this.sqmMin.current;
    var sqmMax = this.sqmMax.current;
    var url =
      window.location.origin +
      "/api/filter?" +
      new URLSearchParams({
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
      <div>
        <NavBar />
        <Filter
          fetchData={this.fetchData}
          numberOfBedrooms={this.numberOfBedrooms}
          numberOfBathrooms={this.numberOfBathrooms}
          priceMin={this.priceMin}
          priceMax={this.priceMax}
          sqmMin={this.sqmMin}
          sqmMax={this.sqmMax}
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

export default HomePage;
