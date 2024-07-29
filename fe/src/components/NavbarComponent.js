import React, { useContext } from "react";
import { Link } from 'react-router-dom';
import '../assets/css/main.css';
import { IntroduceContext } from "../ParentPage";

export default function NavbarComponent() { 
    const introduceInfo = useContext(IntroduceContext);   
    return(  
<header id="header" className="header d-flex align-items-center fixed-top">
    <div className="container-fluid container-xl position-relative d-flex align-items-center">
        <Link to="/" className="logo d-flex align-items-center me-auto">
        <h1 className="sitename">{introduceInfo.info01}</h1>
        </Link>

        <nav id="navmenu" className="navmenu">
            <ul>
                <li>
                    <Link to="/" className="active">Home</Link>
                </li>
                <li>
                    <Link to="/contactus">Contact</Link>
                </li>
            </ul>
            <i className="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <Link to="/login" className="btn-getstarted">Login</Link>
    </div>
</header>
    )
}