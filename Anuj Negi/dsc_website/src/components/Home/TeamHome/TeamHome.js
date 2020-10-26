import React from "react";
import { Link } from "react-router-dom";

//import css
import classes from "./TeamHome.module.css";

//import image
import teamImg from "../../../assets/images/team.png";

const TeamHome = () => {
  return (
    <div className={classes.TeamHome}>
      <div className={classes.Container}>
        <h2 className={classes.teamHeader}>Team</h2>
        <div className={classes.teamContent}>
          <img src={teamImg} alt="team" />
          <div className={classes.teamBody}>
            <p>
              A Team is as efficient as the members of its team are. This is a
              rundown of how explicable each individual is and how they
              supplement the team.
            </p>
            <Link to="/team">SEE MORE</Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default TeamHome;
