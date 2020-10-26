import React from "react";

//import css
import classes from "./Event.module.css";

const Event = (props) => {
  return (
    <>
      <div className={classes.Event}>
        <div className={classes.card}>
          <div className={classes.cardImg}>
            <img src={props.eventImg} alt={props.cardTitle} />
          </div>
          <div className={classes.cardBody}>
            <h3 className={classes.cardTitle}>{props.cardTitle}</h3>
            <h4 className={classes.cardSubtitle}>{props.cardSubtitle}</h4>
            <p className={classes.cardText}>{props.cardText}</p>
            <a href={props.cardHref} className={classes.cardBtn}>
              Learn More
            </a>
          </div>
        </div>
      </div>
    </>
  );
};

export default Event;
