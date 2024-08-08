import React, { useContext, useEffect } from "react";
import { Link, useLocation, useNavigate } from 'react-router-dom';
import '../assets/css/main.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";
import { IntroduceContext } from "../ParentPage";
import { NavbarItemComponent } from "./NavbarItemComponent";


export default function NavbarComponent() {
    const introduceInfo = useContext(IntroduceContext); 
    const isLogined = utils.isLogined(); 
    const location = useLocation();
    const navigate = useNavigate(); 

    const checkAllowPage = () => {
        let isAllow = utils.isAllowPage(location.pathname);
        if (!isAllow) {            
            navigate(constants.page_home);
        }                 
    };

    useEffect(() => { checkAllowPage();}, []);

    return(  
<header id="header" className="header d-flex align-items-center fixed-top">
    <div  className="container-fluid container-xl position-relative d-flex align-items-center">
        <Link to={constants.page_home} className="logo d-flex align-items-center me-auto">
        <h6 className="sitename">{introduceInfo.info01}</h6>
        </Link>

        <nav id="navmenu" className="navmenu">
            <ul>
                <NavbarItemComponent link={constants.page_home} css="active" text={constants.linkText_home} roles={constants.role_list_public} />

                <NavbarItemComponent link={constants.page_contactus} css="active" text={constants.linkText_contactus} roles={constants.role_list_public} />

                <NavbarItemComponent link={constants.page_page01} css="active" text={constants.linkText_page01} roles={constants.role_user} />

                <NavbarItemComponent link={constants.page_testhomepage01} css="active" text={constants.linkText_testhomepage01} roles={constants.role_admin} />

            </ul>
            <i className="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <NavbarItemComponent link={constants.page_login} css="btn-getstarted" text={constants.linkText_login} show={!isLogined} roles={constants.role_list_public} />

        <NavbarItemComponent link={constants.page_logout} css="btn-getstarted" text={constants.linkText_logout} show={isLogined} roles={constants.role_list_admin_user} />
    </div>
</header>
    )
}