import React,{component} from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import YouTube from 'react-youtube';
import './RecentEvent.css';
import Git from '../../../assets/git.png';
import Progate from '../../../assets/progate.jpg';
import Cloud from '../../../assets/cloud-platform.jpg';

class RecentEvent extends React.Component {
    render(){
    const opts = {
        height: '310px',
        width: '90%',
        playerVars: {
          autoplay: 0,
        },
      };


    return(
        <React.Fragment>
            <ReactBootStrap.Container>
             <div className="recentEvent-div">
            <ReactBootStrap.Row>
                <ReactBootStrap.Col className="event-asset">
                <YouTube videoId="TDt9O-dIGYE" opts={opts} onReady={this._onReady} />
                </ReactBootStrap.Col>
                <ReactBootStrap.Col className="recentEvent-imfo">
                    <h2>GIT AND GITHUB WORKSHOP</h2>
                    <img src={Git} alt="git"/>
                    <h4>IN ORDER TO ACQUAINT THE STUDENTS AND LEARNERS WITH AN IN-DEPTH KNOWLEDGE OF GITHUB, DSC AKGEC ORGANISED A WORKSHOP
                        SESSION ON SEPTEMBER 30 LIVE ON DSC AKGEC OFFICIAL YOUTUBE CHANNEL.
                    </h4>
                </ReactBootStrap.Col>
            </ReactBootStrap.Row>
            </div>
            <div className="recentEvent-div">
            <ReactBootStrap.Row>
                <ReactBootStrap.Col className="recentEvent-imfo">
                <h2>WEEK OF LEARNING</h2>
                <h3>In Association With Progate Japan</h3>
                <h4>Week of Learning was an intensive week-long learning program organised by DSC AKGEC is association with Progate Japan where STUDENTS
                    learned web development from absolute basics and build their first website.
                </h4>
                </ReactBootStrap.Col>
                <ReactBootStrap.Col className="event-asset" >
                <img src={Progate} className="progate-img" alt="progate-workshop"/>
                </ReactBootStrap.Col>
            </ReactBootStrap.Row>
            </div>
            <div className="recentEvent-div">
            <ReactBootStrap.Row>
                <ReactBootStrap.Col className="event-asset">
                <img src={Cloud} className="progate-img" alt="progate-workshop"/>
                </ReactBootStrap.Col>
                <ReactBootStrap.Col className="recentEvent-imfo">
                    <h2>GCP CRASH COURSE</h2>
                    <h4>Google cloud platform crash course was organised by DSC AKGEC. This course was completely online and free to all AKGEC students. The content and material was provided by google. 
                    </h4>
                </ReactBootStrap.Col>
            </ReactBootStrap.Row>
            </div>
            </ReactBootStrap.Container>
        </React.Fragment>
    );
    }
}

export default RecentEvent;