import React from 'react';
import './Card.css';
import CardBack from '../../../assets/card-back.jpg';
import Profile from '../../../assets/profile.png';

const Card = (props) => {
    return(
        <section>
                 <div className="card-wrapper">
                     <div className="card">
                     <img src={CardBack} className="card-img"/>
                     <img src={Profile} className="profile-img"/>
                     <h1>{props.name}</h1>
                     <p className="job-title">{props.work}</p>
                     <ul className="social-media">
                         <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                         <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                         <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                         <li><a href="#"><i class="fab fa-github"></i></a></li>
                     </ul>
                     </div>
                 </div>
        </section>
    );
}

export default Card;
