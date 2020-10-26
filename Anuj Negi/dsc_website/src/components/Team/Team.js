import React from "react";

// import css
import classes from "./Team.module.css";

//import Component
import ShowcaseTeam from "./ShowcaseTeam/ShowcaseTeam";
import TeamList from "./TeamList/TeamList";
import Footer from "../UI/Footer/Footer";

class Team extends React.Component {
  // componentDidMount() {
  //   var heightEle = document.querySelector(`.${classes.Team}`).clientHeight;
  //   // console.log(heightEle);
  //   this.props.setHeight(heightEle);
  // }
  render() {
    return (
      <div className={classes.Team}>
        <ShowcaseTeam />
        <TeamList />
        <Footer />
      </div>
    );
  }
}

export default Team;
