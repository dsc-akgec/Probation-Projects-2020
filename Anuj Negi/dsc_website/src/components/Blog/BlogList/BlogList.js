import React from "react";

//import css
import classes from './BlogList.module.css';

//import component
import BlogCard from "../BlogCard/BlogCard";

//import Data
import {BlogData} from '../BlogData';

const BlogList = () => {

  const blogListRender = BlogData.map((data)=>{
    return <BlogCard key={data.id} date={data.date} month={data.month} year={data.year} link={data.link} title={data.title} author={data.author} description={data.description} image = {data.image}/>
  })

  return (
    <div className={classes.BlogList}>
      <div className={classes.Container}>
        {blogListRender}
      </div>
    </div>
  );
};

export default BlogList;
