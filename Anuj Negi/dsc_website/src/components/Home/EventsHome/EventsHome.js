import React from "react";
import { Link } from "react-router-dom";

//css import
import classes from "./EventsHome.module.css";

//image import
import image1 from "../../../assets/images/events.jpg";

//import component
// import Button from "../../UI/Button/Button";
import Card from "../../UI/Card/Card";

const EventsHome = (props) => {
  return (
    <div className={classes.EventsHome}>
      <div className={classes.Container}>
        <h1>Recent Events</h1>
        <div className={classes.cardList}>
          <Card image={image1} href="/">
            <>Card 1</>
            <>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Itaque
              dolores nostrum quos voluptatum culpa ipsam nemo repellat ad
              quisquam omnis?
            </>
          </Card>
          <Card image={image1} href="/">
            <>Card 2</>
            <>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Itaque
              dolores nostrum quos voluptatum culpa ipsam nemo repellat ad
              quisquam omnis?
            </>
          </Card>
          <Card image={image1} href="/">
            <>Card 3</>
            <>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Itaque
              dolores nostrum quos voluptatum culpa ipsam nemo repellat ad
              quisquam omnis?
            </>
          </Card>
        </div>
        <Link to="/events" className={classes.eventBtn}>
          SEE MORE
        </Link>
      </div>
    </div>
  );
};

export default EventsHome;
