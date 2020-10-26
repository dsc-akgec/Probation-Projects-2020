import React from 'react';
import './Footer.css';

const Footer= () =>{
    return(
        <React.Fragment>
        <div className="Footer-div">
            <div>
            <h3>FOLLOW US ON</h3>
            <p><a href="https://www.facebook.com/dscAKGEC/" target="_blank" ><i class="fab fa-facebook ic fa-2x"></i></a>   <a href="https://www.instagram.com/dsc_akgec/?hl=en" target="_blank"><i class="fab fa-instagram ic fa-2x"></i></a>
            <a href="https://www.linkedin.com/company/developer-student-club-akgec" target="_blank"><i class="fab fa-linkedin ic fa-2x"></i></a><a href="" target="_blank"><i class="fa fa-youtube-play fa-2x" aria-hidden="true"></i></a><br/></p>
            <p><a href="https://www.facebook.com/dscAKGEC/" target="_blank">facebook</a><a href="https://www.instagram.com/dsc_akgec/?hl=en" target="_blank">instagram</a>
            <a href="https://www.linkedin.com/company/developer-student-club-akgec" target="_blank">linkedin</a><a href="https://www.youtube.com/channel/UCZvNkM_UNgR4_2fQpBqvWUw" target="_blank">youtube</a></p><a href="#"><button><i class="fas fa-arrow-up"></i></button></a><br/>
            </div>
            
        </div>
        </React.Fragment>
    );
}

export default Footer;