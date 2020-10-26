import React, { Component } from "react";
import { Switch, Route } from "react-router-dom";
import { CSSTransition, TransitionGroup } from "react-transition-group";

//import css
import classes from "./Layout.module.css";

// import component
import Navbar from "../Navigation/Navbar/Navbar";
// import Footer from "../UI/Footer/Footer";
import SideDrawer from "../Navigation/SideDrawer/SideDrawer";
import Home from "../Home/Home";
import Events from "../Events/Events";
import Contact from "../Contact/Contact";
import Team from "../Team/Team";
import Projects from "../Projects/Projects";
import Blog from "../Blog/Blog";

class Layout extends Component {
  // state = {
  //   showSideDrawer: false,
  //   heightStyle: "0px",
  //   heightt: 0,
  // };

  // shouldComponentUpdate(nextProps, nextState) {
  //   return this.state.height !== nextState.height;
  // }

  // relativeHeightHandler = (h) => {
  //   this.setState({
  //     height: h,
  //     heightStyle: `${h}px`,
  //   });
  // };

  sideDrawerClosedHandler = () => {
    this.setState({ showSideDrawer: false });
  };

  sideDrawerToggleHandler = () => {
    this.setState((prevState) => {
      return { showSideDrawer: !prevState.showSideDrawer };
    });
  };

  render() {
    return (
      <>
        <div>
          <Navbar />
          <SideDrawer />
        </div>
        <div
          className={classes.Layout}
          // style={{ height: this.state.heightStyle }}
        >
          <Route
            render={({ location }) => (
              <TransitionGroup component={null}>
                <CSSTransition
                  key={location.key}
                  timeout={450}
                  classNames="fade"
                >
                  <Switch location={location}>
                    <Route path="/" exact component={Home} />
                    <Route path="/events" component={Events} />
                    <Route path="/projects" component={Projects} />
                    <Route path="/blog" component={Blog} />
                    <Route path="/team" component={Team} />
                    <Route path="/contact" component={Contact} />
                  </Switch>
                </CSSTransition>
              </TransitionGroup>
            )}
          />
        </div>
      </>
    );
  }
}

export default Layout;

// return (
//   <>
//     <div>
//       <Navbar />
//       <SideDrawer />
//     </div>
//     <div
//       className={classes.Layout}
//       style={{ height: this.state.heightStyle }}
//     >
//       <Route
//         render={({ location }) => (
//           <TransitionGroup component={null}>
//             <CSSTransition
//               key={location.key}
//               timeout={450}
//               classNames="fade"
//             >
//               <Switch location={location}>
//                 <Route
//                   path="/"
//                   exact
//                   component={() => (
//                     <Home setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//                 <Route
//                   path="/events"
//                   component={() => (
//                     <Events setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//                 <Route
//                   path="/projects"
//                   component={() => (
//                     <Projects setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//                 <Route
//                   path="/blog"
//                   component={() => (
//                     <Blog setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//                 <Route
//                   path="/team"
//                   component={() => (
//                     <Team setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//                 <Route
//                   path="/contact"
//                   component={() => (
//                     <Contact setHeight={this.relativeHeightHandler} />
//                   )}
//                 />
//               </Switch>
//             </CSSTransition>
//           </TransitionGroup>
//         )}
//       />
//     </div>
//     <Footer />
//   </>
// );
