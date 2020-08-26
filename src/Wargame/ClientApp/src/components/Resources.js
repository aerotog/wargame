import React, { Component } from 'react';

export class Resources extends Component {
  static displayName = Resources.name;

  constructor(props) {
    super(props);
    this.state = { food: 0, land: 10 };
  }

  incrementCounter = () => {
    this.setState({
      food: this.state.food + 1
    });
  }

  getLandCost() {
    return (this.state.land-10)^2
  }

  buyLand = () => {
    if (this.state.food > this.getLandCost()) {
      this.setState({
        food: this.state.food - this.getLandCost(),
        land: this.state.land + 1
      });
    }
  }

  render() {
    return (
      <div>
        <h1>Food</h1>

        <p>Click to get food!</p>

        <p aria-live="polite">Current food: <strong>{this.state.food}</strong></p>

        <button className="btn btn-primary" onClick={this.incrementCounter}>Harvest</button>


        <h1>Food</h1>

        <p>Click to buy land!</p>

        <p aria-live="polite">Current land: <strong>{this.state.land}</strong></p>

        <button className="btn btn-primary" onClick={this.buyLand}>Buy land with food</button>
      </div>
    );
  }
}
