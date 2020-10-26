import React from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import AppD from '../../../../assets/app-d.png';
import WebD from '../../../../assets/web-d.png';
import AiMl from '../../../../assets/ai-ml.png';
import Manage from '../../../../assets/manage.png';
import './domain.css';

const domain = () => {
    return (
        <React.Fragment>
            <div className="dom-heading">
                <h3  data-aos="slide-up">OUR DOMAIN</h3>
            </div>
            <div className="dom">
            <ReactBootStrap.Container className="dom-cont">
             <ReactBootStrap.Row className="dom-row">
             <ReactBootStrap.Col lg={true} md={6} sm={12} className="dom-card"  data-aos="zoom-in">
                 <div>
                <div>
                  <img src={AppD} alt="app" className="dom-photo"/>
                </div>
                <div>
                   <h4>APP DEVELOPMENT</h4>
                </div>
                </div>
             </ReactBootStrap.Col>
             <ReactBootStrap.Col lg={true} md={6} sm={12} className="dom-card"  data-aos="zoom-in">
                <div>
                 <div>
                 <img src={WebD} alt="web" className="dom-photo"/>
                </div>
                <div>
                   <h4>WEB DEVELOPMENT</h4>
                </div>
                </div>
             </ReactBootStrap.Col>
             <ReactBootStrap.Col lg={true} md={6} sm={12} className="dom-card"  data-aos="zoom-in">
                <div>
                <div>
                <img src={AiMl} alt="ai-ml" className="dom-photo"/>
                </div>
                <div>
                   <h4>MACHINE LEARNING</h4>
                </div>
                </div>
             </ReactBootStrap.Col>
             <ReactBootStrap.Col lg={true} md={6} sm={12} className="dom-card"  data-aos="zoom-in">
                <div>
                <div>
                  <img src={Manage} alt="managerial" className="dom-photo"/>
                </div>
                <div>
                   <h4>MANAGERIAL</h4>
                </div>
                </div>
             </ReactBootStrap.Col>
             </ReactBootStrap.Row>
            </ReactBootStrap.Container>
            </div>
        </React.Fragment>
    );
}

export default domain;