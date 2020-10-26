import React from "react";

// import css
import classes from "./Events.module.css";

//import component
import ShowcaseEvents from "./ShowcaseEvents/ShowcaseEvents";
import EventsList from "./EventsList/EventsList";
import Footer from "../UI/Footer/Footer";

class Events extends React.Component {
  // componentDidMount() {
  //   var heightEle = document.querySelector(`.${classes.Events}`).clientHeight;
  //   // console.log(heightEle);
  //   this.props.setHeight(heightEle);
  // }
  render() {
    return (
      <div className={classes.Events}>
        <ShowcaseEvents />
        <EventsList />
        <Footer />
      </div>
    );
  }
}

export default Events;
