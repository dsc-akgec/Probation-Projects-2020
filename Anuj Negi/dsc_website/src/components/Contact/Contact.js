import React from "react";

//import css
import classes from "./Contact.module.css";

// import component
import ShowcaseContact from "./ShowcaseContact/ShowcaseContact";
import Footer from "../UI/Footer/Footer";

class Contact extends React.Component {
  // componentDidMount() {
  //   var heightEle = document.querySelector(`.${classes.Contact}`).clientHeight;
  //   // console.log(heightEle);
  //   this.props.setHeight(heightEle);
  // }

  render() {
    return (
      <div className={classes.Contact}>
        <ShowcaseContact />
        <Footer />
      </div>
    );
  }
}

export default Contact;
