import React,{component} from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import YouTube from 'react-youtube';
import './PreviousEvent.css';

class PreviousEvents extends React.Component{
    render(){

        const opts = {
            height: '210px',
            width: '90%',
            playerVars: {
              autoplay: 0,
            },
          };

        return(
            <React.Fragment>
                <div className="previous-event-div">
                <h2 className="DSC-Youtube-heading">DSC AKGEC YOUTUBE CHANNEL</h2>
                <a  href="https://www.youtube.com/channel/UCZvNkM_UNgR4_2fQpBqvWUw" target="_blank" className="link-center"><button className="DSC-Youtube-button">Visit channel</button></a>
                </div>
                <ReactBootStrap.Container>
                    <ReactBootStrap.Row>
                        <ReactBootStrap.Col>
                        <div className="U-div">
                        <YouTube videoId="RpG8_ZPeQcc" opts={opts} onReady={this._onReady} />
                        </div>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col>
                        <div className="U-div">
                        <YouTube videoId="91G4EEXJGYA" opts={opts} onReady={this._onReady} />
                        </div>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col>
                        <div className="U-div">
                        <YouTube videoId="TDt9O-dIGYE" opts={opts} onReady={this._onReady} />
                        </div>
                        </ReactBootStrap.Col>

                    </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </React.Fragment>
        );
    }
}



export default PreviousEvents;