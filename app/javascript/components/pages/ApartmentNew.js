import React, { Component } from "react"
import { Button, Form, FormGroup, Label, Input, FormText } from "reactstrap"
import { Redirect } from "react-router-dom"

class ApartmentNew extends Component {
  constructor(props) {
    super(props)
    this.state = {
      form: {
        street: "",
        city: "",
        state: "",
        manager: "",
        email: "",
        price: "",
        bedrooms: "",
        bathrooms: "",
        pets: "",
        user_id: this.props.current_user.id,
      },
      submitted: false,
    }
  }
  handleChange = (e) => {
    let { form } = this.state
    form[e.target.name] = e.target.value
    this.setState({ form: form })
  }

  handleSubmit = () => {
    this.props.createNewApartment(this.state.form)
    this.setState({ submitted: true })
  }

  render() {
    return (
      <React.Fragment>
        <h1>Create New Listing</h1>
        <Form>
          <FormGroup>
            <Label for="street">Street Address</Label>
            <Input
              type="text"
              name="street"
              onChange={this.handleChange}
              value={this.state.form.street}
            />
          </FormGroup>
          <FormGroup>
            <Label for="city">City</Label>
            <Input
              type="text"
              name="city"
              onChange={this.handleChange}
              value={this.state.form.city}
            />
          </FormGroup>
          <FormGroup>
            <Label for="state">State</Label>
            <Input
              type="text"
              name="state"
              onChange={this.handleChange}
              value={this.state.form.state}
            />
          </FormGroup>
          <FormGroup>
            <Label for="manager">Manager Name</Label>
            <Input
              type="text"
              name="manager"
              onChange={this.handleChange}
              value={this.state.form.manager}
            />
          </FormGroup>
          <FormGroup>
            <Label for="email">Manager's Email</Label>
            <Input
              type="text"
              name="email"
              onChange={this.handleChange}
              value={this.state.form.email}
            />
          </FormGroup>
          <FormGroup>
            <Label for="price">Listing Price</Label>
            <Input
              type="text"
              name="price"
              onChange={this.handleChange}
              value={this.state.form.price}
            />
          </FormGroup>
          <FormGroup>
            <Label for="bedroomSelect">Bedrooms</Label>
            <Input type="select" name="bedrooms" id="bedroomSelect">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10+</option>
              onChange={this.handleChange}
              value={this.state.form.bedrooms}
            </Input>
          </FormGroup>
          <FormGroup>
            <Label for="bathroomSelect">Bedrooms</Label>
            <Input type="select" name="bathroom" id="bathroomSelect">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10+</option>
              onChange={this.handleChange}
              value={this.state.form.bathrooms}
            </Input>
          </FormGroup>
          <FormGroup>
            <Label for="petsSelectMulti">Pets Chooose what applies</Label>
            <Input
              type="select"
              name="selectMulti"
              id="petsSelectMulti"
              multiple
            >
              <option>Dogs</option>
              <option>Cats</option>
              onChange={this.handleChange}
              value={this.state.form.pets}
            </Input>
          </FormGroup>
          <FormGroup>
            <Label for="exampleText">Text Area</Label>
            <Input type="textarea" name="text" id="exampleText" />
          </FormGroup>
          <FormGroup>
            <Label for="exampleFile">File</Label>
            <Input type="file" name="file" id="exampleFile" />
            <FormText color="muted">
              This is some placeholder block-level help text for the above
              input. It's a bit lighter and easily wraps to a new line.
            </FormText>
          </FormGroup>
          <FormGroup tag="fieldset">
            <legend>Radio Buttons</legend>
            <FormGroup check>
              <Label check>
                <Input type="radio" name="radio1" /> Option one is this and
                that—be sure to include why it's great
              </Label>
            </FormGroup>
            <FormGroup check>
              <Label check>
                <Input type="radio" name="radio1" /> Option two can be something
                else and selecting it will deselect option one
              </Label>
            </FormGroup>
            <FormGroup check disabled>
              <Label check>
                <Input type="radio" name="radio1" disabled /> Option three is
                disabled
              </Label>
            </FormGroup>
          </FormGroup>
          <FormGroup check>
            <Label check>
              <Input type="checkbox" /> Check me out
            </Label>
          </FormGroup>
          <Button>Submit</Button>
        </Form>
      </React.Fragment>
    )
  }
}

export default ApartmentNew
