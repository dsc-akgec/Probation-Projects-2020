import React from "react";

import dscLogo from "../../assets/Logo/Logo_1.svg";
import classes from "./Logo.module.css";

const Logo = () => (
  <img className={classes.Logo} src={dscLogo} alt="DSC-logo" />
);

export default Logo;
