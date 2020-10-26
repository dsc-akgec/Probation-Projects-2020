import React from "react";
import { Link } from "react-router-dom";

//import css
import classes from "./BlogHome.module.css";

//import image
import blogImg from "../../../assets/images/Blog.svg";

const BlogHome = () => {
  return (
    <div className={classes.BlogHome}>
      <div className={classes.Container}>
        <h2 className={classes.blogHeader}>Blog</h2>
        <div className={classes.blogContent}>
          <img src={blogImg} alt="blog" />
          <div className={classes.blogBody}>
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Consectetur nisi quam ab tempore velit ipsa blanditiis, tenetur
              inventore! Natus, distinctio?
            </p>
            <Link to="/blog">SEE MORE</Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BlogHome;
