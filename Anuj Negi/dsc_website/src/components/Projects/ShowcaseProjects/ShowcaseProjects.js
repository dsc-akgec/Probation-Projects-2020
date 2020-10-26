import React from "react";

//import css
import classes from "./ShowcaseProjects.module.css";

const ShowcaseProjects = () => {
  return (
    <div className={classes.ShowcaseProjects}>
      <div className={classes.Container}>
        <div className={classes.topContent}>
          <h1 className={classes.projectsHeader}>Projects</h1>
          <p className={classes.projectsText}>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Earum magni accusantium neque et veniam laudantium ratione voluptate dolorum officia tempora!</p>
        </div>
      </div>
    </div>
  );
};

export default ShowcaseProjects;
