import React, { Component } from "react"

class ApartmentShow extends Component {
  render() {
    const { apartment } = this.props
    return (
      <>
        <h1>ApartmentShow</h1>
        <p>{apartment.street}</p>
        <p>{apartment.city}</p>
        <p>{apartment.state}</p>
        <p>{apartment.manager}</p>
        <p>{apartment.email}</p>
        <p>{apartment.price}</p>
        <p>{apartment.bedrooms}</p>
        <p>{apartment.bathrooms}</p>
        <p>{apartment.pets}</p>
      </>
    )
  }
}

export default ApartmentShow
