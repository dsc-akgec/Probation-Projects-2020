import React from "react";

//import css
import classes from "./Success.module.css";

//import image
import successImg from "../../../assets/images/success.svg";

const Success = () => {
  return (
    <div className={classes.formContentLeft}>
      <div className={classes.formSuccess}>
        <h1>
          Thanks for Registering!
          Check your inbox for more details.
        </h1>
      </div>
      <img src={successImg} alt="success" className={classes.formImg2} />
    </div>
  );
};

export default Success;
