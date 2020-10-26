import React from "react";

//import css
import classes from "./BlogCard.module.css";

const BlogCard = (props) => {

  let year = props.year[2]+ props.year[3];

  return (
    <div className={classes.BlogCard}>
      <div className={classes.card}>
        <div className={classes.left}>
          <div className={classes.cardImg}>
            <img src={props.image} alt="blog"/>
          </div>
          <div className={classes.details}>
            <h4>{props.date}</h4>
            <h6>{props.month}</h6>
            <h6>&nbsp;'{year}</h6>
          </div>
        </div>
        <div className={classes.cardBody}>
          <a href={props.link} className={classes.headerLink}>
            <h1 className={classes.cardHeader}>{props.title}</h1>
          </a>
          <div className={classes.author}>
            <h1>{props.author}</h1>
          </div>
          <p className={classes.cardText}>
            {props.description}
          </p>
          <div>
            <a href={props.link} className={classes.readMoreBtn}> 
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BlogCard;
