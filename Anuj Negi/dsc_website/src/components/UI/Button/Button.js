import React from "react";

//css classes
import classes from "./Button.module.css";

const Button = (props) => {
  return (
    <a href={props.href} className={classes.Button} style={props.style}>
      <i className="material-icons">{props.icon}</i>
      <span> {props.children}</span>
    </a>
  );
};

export default Button;
