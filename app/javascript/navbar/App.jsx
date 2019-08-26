import React from 'react';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink } from 'reactstrap';

export default class App extends React.Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.state = {
      isOpen: false
    };
  }

  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }

  render() {
    return (
      <Navbar color="dark" dark expand="md">
        <NavbarBrand href="/">Twain</NavbarBrand>

        <NavbarToggler onClick={this.toggle} />

        <Collapse isOpen={this.state.isOpen} navbar>
          <Nav className="mr-auto" navbar>
            <NavItem>
              <NavLink href="/projects">Projects</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/blogs">Blogs</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/articles">Articles</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/movies">Movies</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/genres">Genres</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/labs">Labs</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/skills">Skills</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/api/dashboard">API</NavLink>
            </NavItem>
          </Nav>
        </Collapse>
      </Navbar>
    );
  }
}
