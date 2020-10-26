import React from 'react';
import Footer from './components/Footer/Footer';
import Imfo from './components/Navbar/Imfo';
import Nav from './components/Navbar/Nav';
import Home from './components/RoutingComponents/HomePage/home/Home';
import Foot from './components/Footer/Footer';
import Team from '../src/components/RoutingComponents/Team/Team';
import {Route , Switch} from 'react-router-dom';
import {Link} from 'react-router-dom';
import Event from './components/RoutingComponents/events/Event';
import Achievements from './components/RoutingComponents/achievements/Achievements';
import Contact from './components/RoutingComponents/Contact/Contact';
import ScrollToTop from './ScrollToTop';


function App() {
  return (
        <React.Fragment>
          <Imfo/>
          <Nav/>
          <ScrollToTop />
          <Switch>
            <Route exact path="/" component={Home}/>
            <Route path="/Team" component={Team}/>
            <Route path="/Event" component={Event}/>
            <Route path="/Achievements" component={Achievements}/>
            <Route path="/Contact" component={Contact}/>
          </Switch>
          <Foot/>
        </React.Fragment>
  );
}

export default App;
