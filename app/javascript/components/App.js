import React, { Component } from "react"

import Header from "./components/Header"
import Footer from "./components/Footer"
import Home from "./pages/Home"
import ApartmentIndex from "./pages/ApartmentIndex"
import ApartmentShow from "./pages/ApartmentShow"
import ApartmentNew from "./pages/ApartmentShow"
import NotFound from "./pages/NotFound"

import { BrowserRouter as Router, Route, Switch } from "react-router-dom"

// import mockApartments from "./mockApartments"

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      apartments: [],
    }
  }

  componentDidMount() {
    this.apartmentIndex()
  }

  apartmentIndex = () => {
    fetch("/apartments")
      .then((response) => {
        return response.json()
      })
      .then((apartmentsArray) => {
        // setting state with data from the backend into the empty array
        this.setState({ apartments: apartmentsArray })
      })
      .catch((errors) => {
        console.log("index errors:", errors)
      })
  }
  render() {
    console.log(this.state.apartments)
    console.log("logged in", this.props.logged_in)
    // console.log("current user", this.props.current_user.id)
    return (
      <Router>
        <Header
          logged_in={this.props.logged_in}
          sign_in_route={this.props.sign_in_route}
          sign_out_route={this.props.sign_out_route}
        />
        <Switch>
          <Route exact path="/" component={Home} />

          {/* -----Index----- */}
          <Route
            path="/aptindex"
            render={(props) => (
              <ApartmentIndex apartments={this.state.apartments} />
            )}
          />
          {/* -----Show----- */}
          <Route
            path="/aptshow/:id"
            render={(props) => {
              let id = props.match.params.id
              let apartment = this.state.apartments.find(
                (apartment) => apartment.id === parseInt(id)
              )
              console.log(id, apartment)
              return <ApartmentShow apartment={apartment} />
            }}
          />

          {/* -----Protected Index----- */}
          {this.props.logged_in && (
            <Route
              path="/myapt"
              render={(props) => {
                let id = this.props.current_user.id
                let myapartments = this.state.apartments.filter(
                  (apt) => apt.user_id === id
                )
                console.log(myapartments)
                return <ProtectedIndex myapartments={myapartments} />
              }}
            />
          )}
          {/* // -----New----- */}
          <Route
            path="/aptnew"
            render={(props) => {
              return (
                <ApartmentNew
                  current_user={this.props.current_user}
                  createNewAprtment={this.createNewApartment}
                />
              )
            }}
          />

          <Route component={NotFound} />
        </Switch>

        <Footer />
      </Router>
    )
  }
}

export default App
