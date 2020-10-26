import React,{Component} from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import StartupBck from '../../../assets/startup-bck.PNG';
import Hihome from '../../../assets/hihome.jpg';
import Ambulon from '../../../assets/Ambulon.jpg';
import ANVESHANA from '../../../assets/ANVESHANA.jpg';

import './Startup.css';

class Startup extends React.Component{
    render(){
        return(
            <React.Fragment>
                <ReactBootStrap.Container>
                    <ReactBootStrap.Row>
                        <ReactBootStrap.Col lg={6} md={12} sm={12}>
                            <div className="startup-card">
                                <div className="startup-div">
                                <img src={StartupBck} className="startup-bck-img"/>
                                <img src={Hihome} className="hihome-img"/>
                                <h2>HIHOME</h2>
                                <h5>Shakti Jaiswal, Pranjal Maurya, Vishesh Dhawan members of Team DSC-AKGEC have their own startup named HiHome along with Rachit Yadav and Raghav Bansal.
                                    HiHome provides a territory for artists to present their art to the customers and citr the values along with designs that set their product apart from the 
                                    usual in order to bridge the long-thought-of gap between sellers and customers.  </h5>
                                </div>
                            </div>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col lg={6} md={12} sm={12}>
                        <div className="startup-card">
                                <div className="startup-div">
                                <img src={StartupBck} className="startup-bck-img"/>
                                <img src={Ambulon} className="hihome-img"/>
                                <h2>AMBULON</h2>
                                <h5>Meet Rishab Singh and Tarun Rghav, members of Team DSC-AKGEC. They have founded a startup named AMBULON. It is smart emergency care system which offers the solution to deaths 
                                    being caused due to late arrival of ambulace.The device detects accidents and alerts nearest ambulance and saves lives. Team pitched their idea to investors at B-Plan Pitch Perfect and secured third Position.
                                </h5>
                                </div>
                            </div>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col lg={6} md={12} sm={12}>
                        <div className="startup-card">
                                <div className="startup-div">
                                <img src={StartupBck} className="startup-bck-img"/>
                                <img src={ANVESHANA} className="hihome-img"/>
                                <h2>AI BASED WILDLIFE PREDICTION AND PREVENTION</h2>
                                <h5>The members of DSC-AKGEC participated in a model presentation competiton-ANVESHANA'20 powered by Agastya Foundation and collaberated by Synopsys GRoup. It was a two day model presentaion event in which more than 
                                    30 teams were shortlisted among 300 registered team. Our team member Pranjul Itondia and Shivam Bisht won prize money of Rs5000. Their achievement is a motivation for each one of DSC members.
                                </h5>
                                </div>
                            </div>
                        </ReactBootStrap.Col>
                    </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </React.Fragment>
        );
    }
}

export default Startup;