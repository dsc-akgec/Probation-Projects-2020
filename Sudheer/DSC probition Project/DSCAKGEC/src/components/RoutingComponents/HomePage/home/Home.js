import React from 'react';
import './home.css';
import * as ReactBootStrap from 'react-bootstrap';
import bckTeam from '../../../../assets/bckTeam.png';
import Domain from '../domain/Domain';
import Imformation from '../imformation/Imformation';
import Youtube from '../youtube section/Youtube';
import Mmap from '../map section/Mmap';
import {Link} from 'react-router-dom';

const Landing = () => {


    const green = {
        color:"green"
    }
    const blue = {
        color:"blue"
    }
    const red = {
        color:"red"
    }
    const yellow = {
        color:"yellow"
    }


    return(
        <React.Fragment>
       <div className="Intro">
           <div className="Intro-div">
           <ReactBootStrap.Container>
               <ReactBootStrap.Row>
                   <ReactBootStrap.Col lg={true} md={12}>
                       <div className="head_div">
                        <h1>Developer Student Club</h1>
                        <h3>Powered By <span style={blue}>G</span>
                        <span style={red}>O</span>
                        <span style={yellow}>O</span>
                        <span style={blue}>G</span>
                        <span style={green}>L</span>
                        <span style={red}>E</span> Developers </h3>
                        <h3>Ajay Kumar Garg Engineering College</h3>
                        </div>
                        <div className="buttons-div">
                        <Link to="/Event"><button className="events-button">EVENTS</button></Link>
                        <Link to="/Contact"><button className="contact-button">CONTACT</button></Link>
                        </div>
                   </ReactBootStrap.Col>
                   <ReactBootStrap.Col lg={true} md={12}>
                       <img src={bckTeam} alt="png" height="100%" width="100%"/>
                   </ReactBootStrap.Col>
               </ReactBootStrap.Row>
           </ReactBootStrap.Container>
           <div className="down_button" id="domain">
               <a href="#domain"><button ><i class="fas fa-arrow-down"></i></button></a>
           </div>
           </div>
       </div>
       <div >
       <Domain/>
       <Imformation/>
       <Youtube/>
       <Mmap/>
       </div>
    </React.Fragment>
    );
}

export default Landing;