import React from "react";

//import css
import classes from "./Blog.module.css";

//import component
import ShowcaseBlog from "./ShowcaseBlog/ShowcaseBlog";
import BlogList from "./BlogList/BlogList";
import Footer from "../UI/Footer/Footer";

class Blog extends React.Component {
  // componentDidMount() {
  //   var heightEle = document.querySelector(`.${classes.Blog}`).clientHeight;
  //   // console.log(heightEle);
  //   this.props.setHeight(heightEle);
  // }
  render() {
    return (
      <div className={classes.Blog}>
        <ShowcaseBlog />
        <BlogList />
        <Footer />
      </div>
    );
  }
}

export default Blog;
