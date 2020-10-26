import React from "react";
import { Link } from "react-router-dom";

// import css
import classes from "./Footer.module.css";

//icon Import
import * as FiIcons from "react-icons/fi";

//import component
import Logo from "../../Logo/Logo";

const Footer = (props) => {
  return (
    <footer className={classes.Footer}>
      <div className={classes.Container}>
        <div className={classes.footerTop}>
          <div className={classes.logo}>
            <Link to="/">
              <Logo />
            </Link>
          </div>
          <div className={classes.quickLinks}>
            <h5 className={classes.linkHeader}>Quick Links</h5>
            <ul className={classes.linkList}>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/events">Events</Link>
              </li>
              <li>
                <Link to="/projects">Projects</Link>
              </li>
              <li>
                <Link to="/blog">Blog</Link>
              </li>
              <li>
                <Link to="/team">Team</Link>
              </li>
            </ul>
          </div>
          <div className={classes.socials}>
            <h5 className={classes.socialsHeader}>Social</h5>
            <ul className={classes.socialLinks}>
              <li>
                <a href="https://www.instagram.com/dsc_akgec/">
                  <FiIcons.FiInstagram />
                </a>
              </li>
              <li>
                <a href="https://www.instagram.com/dsc_akgec/">
                  <FiIcons.FiFacebook />
                </a>
              </li>
              <li>
                <a href="https://www.instagram.com/dsc_akgec/">
                  <FiIcons.FiLinkedin />
                </a>
              </li>
            </ul>
          </div>
        </div>
        <hr className={classes.footerGap} />
        <div className={classes.footerBottom}>
          <div className={classes.footerBottomContainer}>
            <div className={classes.copyright}>&copy; Anuj Negi</div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
