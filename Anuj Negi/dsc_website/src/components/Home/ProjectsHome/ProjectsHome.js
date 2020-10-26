import React from "react";
import { Link } from "react-router-dom";

//import css
import classes from "./ProjectsHome.module.css";

//image import
import projectsImg from "../../../assets/images/projects.png";

const ProjectsHome = () => {
  return (
    <div className={classes.ProjectsHome}>
      <div className={classes.Container}>
        <h2 className={classes.projectsHeader}>Projects</h2>
        <div className={classes.projectsContent}>
          <img src={projectsImg} alt="projects" />
          <div className={classes.projectsBody}>
            <p>
              The projects show what a team stands for and what mindset they
              keep towards transforming this world into a better place.
            </p>
            <Link to="/projects">SEE MORE</Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProjectsHome;
