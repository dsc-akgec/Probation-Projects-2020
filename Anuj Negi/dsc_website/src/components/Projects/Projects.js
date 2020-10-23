import React from "react";

// import css
import classes from "./Projects.module.css";

//import component
import ShowcaseProjects from "./ShowcaseProjects/ShowcaseProjects";
import ProjectsList from "./ProjectsList/ProjectsList";
import Footer from "../UI/Footer/Footer";

class Projects extends React.Component {
  // componentDidMount() {
  //   var heightEle = document.querySelector(`.${classes.Projects}`).clientHeight;
  //   // console.log(heightEle);
  //   this.props.setHeight(heightEle);
  // }
  render() {
    return (
      <div className={classes.Projects}>
        <ShowcaseProjects />
        <ProjectsList />
        <Footer />
      </div>
    );
  }
}

export default Projects;
