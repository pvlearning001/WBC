import React, { useContext, useEffect } from "react";
import { useLocation, useNavigate } from 'react-router-dom';
import '../assets/css/main.css';
import * as constants from "../jscode/constants";
import * as intro from "../jscode/introInfo";
import * as utils from "../jscode/utilities";
import { IntroduceContext } from "../ParentPage";
import { NavbarItemComponent } from "./NavbarItemComponent";


export default function NavbarAdminComponent() {
    const introduceInfo = useContext(IntroduceContext); 
    const isLogined = utils.isLogined(); 
    const location = useLocation();
    const navigate = useNavigate(); 
    const fullName = localStorage.getItem(constants.token_fullName);
    let welcome = "";
    if (!utils.isNullOrEmptyOrSpace(fullName)){
        welcome = constants.text_Navbar_Welcome + constants.string_space + fullName;
    }

    const checkAllowPage = () => {
        let isAllow = utils.isAllowPage(location.pathname);
        if (!isAllow) {            
            navigate(constants.page_home);
        }                 
    };

    useEffect(() => { checkAllowPage();}, []);

    return( 
<div className="container-fluid header align-items-center navbar-header">
    <div className="row d-flex">
        <div className="container-xl position-relative d-flex align-items-center">
            <div className="logo d-flex align-items-center me-auto">
                <h6 className="navbar-company-name">{intro.text_header_admin}</h6>
            </div>

            <nav id="navmenu" className="navmenu">
                <ul>
                    <NavbarItemComponent link={constants.page_home} css="active" text={constants.linkText_home} roles={constants.role_list_public} />

                    <NavbarItemComponent link={constants.page_admin_courses} css="active" text={constants.linkText_admin_courses} roles={constants.role_admin} />

                    <NavbarItemComponent link={constants.page_admin_marks} css="active" text={constants.linkText_admin_marks} roles={constants.role_admin} />

                    <NavbarItemComponent link={constants.page_admin_messages} css="active" text={constants.linkText_admin_messages} roles={constants.role_admin} />
                    
                    <NavbarItemComponent link={constants.page_admin_users} css="active" text={constants.linkText_admin_users} roles={constants.role_admin} />

                </ul>
                <i className="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>
            <NavbarItemComponent link={constants.page_login} css="btn-getstarted" text={constants.linkText_login} show={!isLogined} roles={constants.role_list_public} />

            <NavbarItemComponent link={constants.page_logout} css="btn-getstarted" text={constants.linkText_logout} show={isLogined} roles={constants.role_list_admin_user} />
        </div>
    </div> 
    <div className="row">        
        <div className="navbar-welcome-header"> {welcome} </div>
    </div>        
</div>
    )
}