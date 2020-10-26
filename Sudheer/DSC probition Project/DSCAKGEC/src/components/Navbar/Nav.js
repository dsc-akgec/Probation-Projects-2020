import React from 'react';
import './nav.css';
import * as ReactBootStrap from 'react-bootstrap';
import DSC from '../../assets/Dsc.png';
import Imfo from './Imfo';
import {Link} from 'react-router-dom';

function Nav() {
  
  

  const LastLink ={
    marginRight: '2rem'
  }

  const style={
    overflow: 'hidden'
  }

  return (
    <React.Fragment>
    <div className="fixing">
      <ReactBootStrap.Navbar collapseOnSelect expand="lg" bg="light" variant="light" className="bar">
  <ReactBootStrap.Navbar.Brand href="#home" ClassName="brand"><div style={style} ><img src={DSC} alt="Dsc logo" className="photoStyle"/></div></ReactBootStrap.Navbar.Brand>
  <ReactBootStrap.Navbar.Toggle aria-controls="responsive-navbar-nav" />
  <ReactBootStrap.Navbar.Collapse id="responsive-navbar-nav">
    <ReactBootStrap.Nav className="mr-auto">
    </ReactBootStrap.Nav>
    <div className="in-center">
    <ReactBootStrap.Nav>
    <ReactBootStrap.Nav.Link href="#deets" ><p className="textHover"><Link to="/" style={{ textDecoration: 'none' }}>Home</Link></p></ReactBootStrap.Nav.Link>
    <ReactBootStrap.Nav.Link href="#deets" ><p className="textHover"><Link to="/Achievements" style={{ textDecoration: 'none' }}>Achievements</Link></p></ReactBootStrap.Nav.Link>
      <ReactBootStrap.Nav.Link href="#deets" ><p className="textHover"><Link to="/Event" style={{ textDecoration: 'none' }}>Events</Link></p></ReactBootStrap.Nav.Link>
      <ReactBootStrap.Nav.Link eventKey={2} href="#memes" style={LastLink}>
      <p className="textHover"><Link to="/Team" style={{ textDecoration: 'none' }}>Team</Link></p>
      </ReactBootStrap.Nav.Link>
    </ReactBootStrap.Nav>
    </div>
  </ReactBootStrap.Navbar.Collapse>
</ReactBootStrap.Navbar>
    </div>
    </React.Fragment>
  );
}

export default Nav;
