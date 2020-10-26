import React from "react";

//import css
import classes from "./ShowcaseBlog.module.css";

const ShowcaseBlog = () => {
  return (
    <div className={classes.ShowcaseBlog}>
      <div className={classes.Container}>
        <div className={classes.topContent}>
          <h1 className={classes.showcaseHeader}>
            Blog
          </h1>
          <p className={classes.contentInfo}>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, sapiente quo. Qui nostrum omnis provident? Quam illo a natus ex.
          </p>
        </div>
      </div>
    </div>
  );
};

export default ShowcaseBlog;
