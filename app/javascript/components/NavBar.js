import React from "react";
import Logo from "images/logo-white.svg";
class NavBar extends React.Component {
  render() {
    return (
      <div className="nav-bar">
        <div className="logo">
          <img src={Logo}></img>
        </div>
        <div className="search">
          <span>
            <input
              className="w3-input w3-border w3-round title-field"
              type="text"
              name="title"
              placeholder="Barcelona"
            />
            <button className="search-magnifier">
              <span className="glyphicon glyphicon-search"></span>
            </button>
          </span>
        </div>
        <div className="filters-button">
          <p className="filters-paragraph">Filters</p>
          <span className="glyphicon glyphicon-chevron-down filters-arrow"></span>
        </div>
      </div>
    );
  }
}

export default NavBar;
