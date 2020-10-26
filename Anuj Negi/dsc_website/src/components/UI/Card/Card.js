import React from "react";
// import { NavLink } from "react-router-dom";

// css import
import classes from "./Card.module.css";

const Card = (props) => {
  return (
    <>
      <div className={classes.card}>
        <img
          src={props.image}
          alt={props.imgData}
          className={classes.cardImage}
        />
        <div className={classes.cardBody}>
          <a href={props.href}>
            <h3 className={classes.cardHeader}>{props.children[0]}</h3>
          </a>
          <p>{props.children[1]}</p>
          <a href={props.href} className={classes.btn}>
            Read
          </a>
        </div>
      </div>
    </>
  );
};

export default Card;
