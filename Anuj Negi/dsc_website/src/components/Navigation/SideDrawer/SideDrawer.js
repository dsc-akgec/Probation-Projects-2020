import React, { useState } from "react";
import { Link, NavLink } from "react-router-dom";
// import CSS
import classes from "./SideDrawer.module.css";

// import icons
import * as MdIcons from "react-icons/md";

// import components
import Logo from "../../Logo/Logo";

const SideDrawer = (props) => {
  const [sidebar, setSidebar] = useState(false);
  const [shadow, setShadow] = useState(false);

  const boxShadowHandler = () => {
    if (window.scrollY >= 100) {
      setShadow(true);
    } else if (window.scrollY < 100) {
      setShadow(false);
    }
  };

  let shadowActiveclass = [classes.SideDrawer, null];

  if (shadow === true) {
    shadowActiveclass = [classes.SideDrawer, classes.active];
  }

  window.addEventListener("scroll", boxShadowHandler);

  const showSidebar = () => setSidebar(!sidebar);

  const navMenuActive = [classes.navMenu, classes.navActive];
  return (
    <div className={classes.Container}>
      <div className={shadowActiveclass.join(" ")}>
        <MdIcons.MdMenu onClick={showSidebar} className={classes.menuBars} />
        &nbsp;
        <Link to="/">
          <Logo />
        </Link>
      </div>
      <nav className={sidebar ? navMenuActive.join(" ") : classes.navMenu}>
        <ul className={classes.navMenuItems} onClick={showSidebar}>
          <li className={classes.SideDrawerToggle}>
            <Link to="#" className={classes.menuBars}>
              <MdIcons.MdClose className={classes.close} />
            </Link>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/"
              exact
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdHome />
              <span>Home</span>
            </NavLink>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/projects"
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdWork />
              <span>Projects</span>
            </NavLink>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/events"
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdEvent />
              <span>Events</span>
            </NavLink>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/blog"
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdBook />
              <span>Blogs</span>
            </NavLink>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/team"
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdPeople />
              <span>Team</span>
            </NavLink>
          </li>
          <li className={classes.navText}>
            <NavLink
              to="/contact"
              className={classes.menuBars}
              activeClassName={classes.selected}
            >
              <MdIcons.MdMessage />
              <span>Register</span>
            </NavLink>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default SideDrawer;
