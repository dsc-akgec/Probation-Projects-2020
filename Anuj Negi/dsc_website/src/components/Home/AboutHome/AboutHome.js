import React from "react";

// import CSS
import classes from "./AboutHome.module.css";

// import image
import about from "../../../assets/images/aboutUS.png";
import appDevelopment from "../../../assets/images/appDevelopment.svg";
import webDevelopment from "../../../assets/images/webDevelopment.svg";
import machineLearning from "../../../assets/images/Background_1.svg";
import management from "../../../assets/images/management.svg";

const AboutHome = (props) => {
  const redHeader = [classes.red, classes.cardHeader];
  const blueHeader = [classes.blue, classes.cardHeader];
  const greenHeader = [classes.green, classes.cardHeader];
  const yellowHeader = [classes.yellow, classes.cardHeader];

  return (
    <>
      <div className={classes.container}>
        <div className={classes.AboutHome}>
          <div>
            <h2>
              What does&nbsp;<strong>DSC-AKGEC</strong> do?
            </h2>
            <p>
              We at
              <strong>&nbsp;DSC-AKGEC&nbsp;</strong>
              are a passionate group of people who work towards bringing a
              change in the ecosystem of development around the campus. We want
              to create a healthy environment for the budding developers to
              create solutions to real life problems and promote the
              <strong>&nbsp;developer culture</strong>.
            </p>
            <img src={about} className={classes.AboutHomeImg} alt="" />
          </div>
        </div>
        <div className={classes.Domains}>
          <h2>Fields we work in</h2>
          <div className={classes.card}>
            <div>
              <div className={classes.cardBody}>
                <h3 className={blueHeader.join(" ")}>Web Development</h3>
                <p className={classes.cardText}>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Explicabo dolorem necessitatibus, quaerat repudiandae aliquam
                  maxime vitae rem, minus aperiam dolorum dolore labore, laborum
                  cum voluptatum architecto. Fuga ipsam ex qui.
                </p>
              </div>
              <img
                src={webDevelopment}
                alt="Web Development"
                className={classes.DomainsImg}
              />
            </div>
          </div>
          <div className={classes.card}>
            <div>
              <div className={classes.cardBody}>
                <h3 className={redHeader.join(" ")}>Machine Learning</h3>
                <p className={classes.cardText}>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Explicabo dolorem necessitatibus, quaerat repudiandae aliquam
                  maxime vitae rem, minus aperiam dolorum dolore labore, laborum
                  cum voluptatum architecto. Fuga ipsam ex qui.
                </p>
              </div>
              <img
                src={machineLearning}
                alt="Machine Learning"
                className={classes.DomainsImg}
              />
            </div>
          </div>
          <div className={classes.card}>
            <div>
              <div className={classes.cardBody}>
                <h3 className={yellowHeader.join(" ")}>App Development</h3>
                <p className={classes.cardText}>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Explicabo dolorem necessitatibus, quaerat repudiandae aliquam
                  maxime vitae rem, minus aperiam dolorum dolore labore, laborum
                  cum voluptatum architecto. Fuga ipsam ex qui.
                </p>
              </div>
              <img
                src={appDevelopment}
                alt="App Development"
                className={classes.DomainsImg}
              />
            </div>
          </div>
          <div className={classes.card}>
            <div>
              <div className={classes.cardBody}>
                <h3 className={greenHeader.join(" ")}>Management</h3>
                <p className={classes.cardText}>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Explicabo dolorem necessitatibus, quaerat repudiandae aliquam
                  maxime vitae rem, minus aperiam dolorum dolore labore, laborum
                  cum voluptatum architecto. Fuga ipsam ex qui.
                </p>
              </div>
              <img
                src={management}
                alt="Management"
                className={classes.DomainsImg}
              />
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default AboutHome;
