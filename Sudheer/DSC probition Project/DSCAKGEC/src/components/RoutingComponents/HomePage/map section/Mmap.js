import React,{Component} from 'react';
import GoogleMapReact from 'google-map-react';
import {Map, InfoWindow, Marker, GoogleApiWrapper} from 'google-maps-react';
import * as ReactBootStrap from 'react-bootstrap';
import './Mmap.css';


class Mmap extends React.Component{

    render(){
        const containerStyle = {
            width: '70%',
            height: '400px',
            borderRadius: '10px'
          }
        return(
            <div>
                <ReactBootStrap.Container>
                    <ReactBootStrap.Row>
                        <ReactBootStrap.Col>
                            <p>Ajay Kumar Garg Engineering College</p>
                            <p>Ghaziabad</p>
                            <p>Uttar Pradesh</p>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col>
                            <p>Affliated with AKTU</p>
                            <p><a href="https://aktu.ac.in" target="_blank">visit University website </a></p>
                        </ReactBootStrap.Col>
                        <ReactBootStrap.Col>
                            <p><a href="https://akgec.ac.in" target="_blank">visit College website</a></p>
                        </ReactBootStrap.Col>
                    </ReactBootStrap.Row>
                </ReactBootStrap.Container>
                <ReactBootStrap.Container>
                <ReactBootStrap.Row>
                <div className="map_div">
                <Map google={this.props.google} containerStyle={containerStyle} zoom={11}
                initialCenter={{
                    lat: 28.6771,
                    lng:  77.5002
                  }}>
 
                <Marker onClick={this.onMarkerClick}
                name={'Current location'} />

                <InfoWindow onClose={this.onInfoWindowClose}>
                </InfoWindow>
                </Map>
        
                </div>
                </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </div>
           
        );
    }
}

export default GoogleApiWrapper({
    apiKey: ("AIzaSyAgC5tK2QkV36OngOcIoWsfqj78i0pxZ4s")
  })(Mmap)