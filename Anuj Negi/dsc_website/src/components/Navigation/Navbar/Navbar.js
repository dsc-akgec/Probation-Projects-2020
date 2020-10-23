import React, { useState } from "react";
import { NavLink } from "react-router-dom";

import classes from "./Navbar.module.css";
import Logo from "../../Logo/Logo";

const Navbar = () => {
  const [navbar, setNavabr] = useState(false);

  const boxShadowHandler = () => {
    if (window.scrollY >= 100) {
      setNavabr(true);
    } else if (window.scrollY < 100) {
      setNavabr(false);
    }
  };

  let navbarActiveclass = [classes.Navbar, null];

  if (navbar === true) {
    navbarActiveclass = [classes.Navbar, classes.active];
  }

  window.addEventListener("scroll", boxShadowHandler);

  return (
    <header>
      <div className={navbarActiveclass.join(" ")}>
        <div className={classes.Container}>
          <div className={classes.NavbarLeft}>
            <NavLink to="/" className={classes.NavbarLogo}>
              <Logo />
            </NavLink>
          </div>
          <div className={classes.NavbarRight}>
            <ul className={classes.NavigationItems}>
              <li className={classes.NavigationItem}>
                <NavLink to="/" exact activeClassName={classes.selected}>
                  Home
                </NavLink>
              </li>
              <li className={classes.NavigationItem}>
                <NavLink to="/events" activeClassName={classes.selected}>
                  Events
                </NavLink>
              </li>
              <li className={classes.NavigationItem}>
                <NavLink to="/projects" activeClassName={classes.selected}>
                  Projects
                </NavLink>
              </li>
              <li className={classes.NavigationItem}>
                <NavLink to="/blog" activeClassName={classes.selected}>
                  Blog
                </NavLink>
              </li>
              <li className={classes.NavigationItem}>
                <NavLink to="/team" activeClassName={classes.selected}>
                  Team
                </NavLink>
              </li>
              <li className={classes.NavigationItem}>
                <NavLink to="/contact" activeClassName={classes.selected}>
                  Register
                </NavLink>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Navbar;

// import { CSSTransition } from "react-transition-group";

// <CSSTransition
//   in={true}
//   appear={true}
//   timeout={{
//     appear: 400,
//   }}
//   classNames={{ ...classes }}
// >
// </CSSTransition>
