import React from "react";

//import css
import classes from "./EventsList.module.css";

import Event from "../Event/Event";

//DataFile import
import { EventsData } from "../EventsData";

const EventsList = () => {
  return (
    <div className={classes.EventsList}>
      <div className={classes.wrapper}>
        {EventsData.map((Card) => {
          return (
            <Event
              key={Card.id}
              eventImg={Card.eventImg}
              cardTitle={Card.cardTitle}
              cardSubtitle={Card.cardSubtitle}
              cardText={Card.cardText}
              cardHref={Card.cardHref}
            />
          );
        })}
      </div>
    </div>
  );
};

export default EventsList;
