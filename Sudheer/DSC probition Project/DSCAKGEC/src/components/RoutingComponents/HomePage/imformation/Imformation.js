import React from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import PortProject from '../../../../assets/port-project.jpg';
import Training from '../../../../assets/training.png';
import Networking from '../../../../assets/networking.png';
import './imformation.css';

const Imformation = () => {
    return(
        <>
        <div className="imformation">
            <div data-aos="flip-right">
                <ReactBootStrap.Container>
                <ReactBootStrap.Row className="imfo-row">
                    <ReactBootStrap.Col lg={6} sm={12}  className="imfo-image">
                        <img src={PortProject} alt="image" height="250px" width="300px"/>
                    </ReactBootStrap.Col>
                    <ReactBootStrap.Col lg={6} sm={12} className="imfo-content">
                        <h4>WHAT DOES DSC DO?</h4>
                        <h5>Developer Student Clubs are university based community groups for students interested in Google developer technologies.By joining a DSC,
                             students grow their knowledge in a peer-to-peer learning environment and build solutions for local businesses and their community.</h5>
                    </ReactBootStrap.Col>
                </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </div>
            <div  data-aos="flip-right">
                <ReactBootStrap.Container>
                <ReactBootStrap.Row className="imfo-row" >
                    <ReactBootStrap.Col lg={6} sm={12} className="imfo-content">
                        <h4>LEARNING</h4>
                        <h5>DSC AKGEC provides opportunity to learn a wide range of technical topics where new skills can be learned through
                             various projects and workshops.One gets chance to advance skills and career.Give back to community by helping others to learn as well.</h5>
                    </ReactBootStrap.Col>
                    <ReactBootStrap.Col lg={6} sm={12}  className="imfo-image">
                        <img src={Training} alt="image" height="250px" width="300px"/>
                    </ReactBootStrap.Col>
                </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </div>
            <div  data-aos="flip-left">
                <ReactBootStrap.Container>
                <ReactBootStrap.Row className="imfo-row">
                    <ReactBootStrap.Col lg={6} sm={12}  className="imfo-image">
                        <img src={Networking} alt="image" height="250px" width="400px"/>
                    </ReactBootStrap.Col>
                    <ReactBootStrap.Col lg={6} sm={12} className="imfo-content">
                    <h4>NETWORKING</h4>
                        <h5>Meet other students on campus interested in developer technologies. Our members with similar interests make better development environment where everyone get chance to learn from each other. </h5>
                    </ReactBootStrap.Col>
                </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </div>
        </div>
        </>
    );
}

export default Imformation;