import React,{Component} from 'react';
import * as ReactBootStrap from 'react-bootstrap';
import ContactFormImg from '../../../assets/contactForm-img.PNG';
import {Link} from 'react-router-dom';
import './Contact.css';
import emailjs from 'emailjs-com'
import { render } from '@testing-library/react';
import swal from 'sweetalert';

class Contact extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            name : "",
            email : "",
            message : "",
            res:false
        }
        this.sendEmail = this.sendEmail.bind(this);
        this.validateForm = this.validateForm.bind(this);
        this.onChangeInput1 = this.onChangeInput1.bind(this);
        this.onChangeInput2 = this.onChangeInput2.bind(this);
        this.onChangeInput3 = this.onChangeInput3.bind(this);
    }

    onChangeInput1(event){
        const value = event.target.value;
        this.setState({
          name: value
        });
        console.log(this.state.name);
    };
    onChangeInput2(event){
        const value = event.target.value;
        this.setState({
          email: value
        });
        console.log(this.state.email);
    };
    onChangeInput3(event){
        const value = event.target.value;
        this.setState({
          message: value
        });
        console.log(this.state.message);
    };

     validateForm(){
                if(this.state.name)
                {
                    if(this.state.message)
                    {
                        if(this.state.message)
                        {
                            this.setState({
                                res: true
                              });
                        }else{
                            this.setState({
                                res: false
                              });
                        }
                    }else{
                        this.setState({
                            res: false
                          });
                    }
                }
                else{
                    this.setState({
                        res: false
                      });
                }
            }
            sendEmail(e){
                e.preventDefault();
                if(this.state.res==true)
                {
                emailjs.sendForm('sid07', 'template_1f5mamg', e.target, 'user_4nIApTXdw8ky6u9QqYlBs')
                  .then((result) => {
                    swal("Done", "email has been sent successfuly", "success");
                    this.setState({
                        name : "",
                        email : "",
                        message : "",
                        res:false
                      });
                  }, (error) => {
                    swal("Oops!", "Something went wrong!", "error");;
                  });
                }
                else{
                    swal("fill all details", "", "error");
                }
            }

    
        render(){
            
        return(
            <React.Fragment>
                <ReactBootStrap.Container>
                <ReactBootStrap.Row className="contact-row">
                    
                    <ReactBootStrap.Col lg={6} md={12} sm={12}>
                        <div className="contact-img=div">
                            <img src={ContactFormImg} alt="form=img" className="contact-img"/>
                        </div>
                    </ReactBootStrap.Col>
                    <ReactBootStrap.Col lg={6} md={12} sm={12}>
                            <div className="contact-input">
                                <h3>Contact US</h3>
                                <h5>Want to get in touch?. Write to us...</h5>
                                <form className="contact-form" onSubmit={this.sendEmail}>
                                <input type="text" name="name" value={this.state.name} placeholder="Name" onChange={(e) => this.onChangeInput1(e)}/>
                                <input type="email" name="email" value={this.state.email} placeholder="email" onChange={(e) => this.onChangeInput2(e)}/>
                                <textarea name="message" value={this.state.message} placeholder="write message.." onChange={(e) => this.onChangeInput3(e)}/>
                                <input type="submit" value="Send" className="btn" onClick={this.validateForm}/>
                                </form>
                                </div>
                    </ReactBootStrap.Col>
                </ReactBootStrap.Row>
                </ReactBootStrap.Container>
            </React.Fragment>
        );
}
}

export default Contact;