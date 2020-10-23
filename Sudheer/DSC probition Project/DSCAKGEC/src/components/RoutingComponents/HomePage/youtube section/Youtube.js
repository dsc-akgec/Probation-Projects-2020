import React,{component} from 'react';
import YouTube from 'react-youtube';
import * as ReactBootStrap from 'react-bootstrap';
import './Youtube.css';

class Youtube extends React.Component{
    render(){

        const opts = {
            height: '340px',
            width: '500px',
            playerVars: {
              autoplay: 0,
            },
          };

        return(
            <div className="utube" data-aos="slide-right">
                    <ReactBootStrap.Row>
                        <ReactBootStrap.Col lg={6} md={12}>
                        <div>
                            <h1>Developer Student Clubs<br/>2019 India Leads Summit</h1>
                            <h3> It was a 2-day conference from 23rd August 2019 to 25th August 2019 and 182 DSC Leads across India attended the summit at Goa.</h3>
                        </div>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col lg={6} md={12} className="youtube-col">
                        <div>
                          <YouTube videoId="5HStQYsx5FE" opts={opts} onReady={this._onReady} />
                        </div>
                        </ReactBootStrap.Col>
                    </ReactBootStrap.Row>
            </div>
           
        );
    }
}

export default Youtube;