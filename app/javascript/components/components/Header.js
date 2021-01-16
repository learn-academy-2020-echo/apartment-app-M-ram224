import React from "react"

class Header extends React {
  render() {
    const { logged_in, sign_in_route, sign_out_route } = this.props
    console.log(this.props.logged_in)
    return (
      <React.Fragment>
        <h1>Apartment Finder</h1>
        {!logged_in && (
          <div>
            <a href={sign_in_route}>Sign In</a>
          </div>
        )}
        {logged_in && (
          <div>
            <a href={sign_out_route}>Sign Out</a>
          </div>
        )}
      </React.Fragment>
    )
  }
}

export default Header
