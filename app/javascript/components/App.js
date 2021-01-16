import React from "react"
import PropTypes from "prop-types"
class App extends React.Component {
  render() {
    const { logged_in, sign_in_route, sign_out_route } = this.props
    console.log(this.props.logged_in)
    return (
      <Router>
        <Header />
        <Switch>
          <Route exact path="/" component={Home} />
        </Switch>

        <Footer />
      </Router>
    )
  }
}

export default App
