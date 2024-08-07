import React, { useEffect } from "react";
import { useLocation, useNavigate } from 'react-router-dom';
import '../assets/css/main.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

export default function CheckLoginedComponent() {  
    const navigate = useNavigate();
    const location = useLocation();
    
    const checkLogined = () => {      
        if (!utils.isLogined()) {            
            navigate(constants.page_home);
        }         
    };

    const checkInRoles = () => {
        let isRole = utils.isAllowPage(location.pathname);
        if (!isRole) {            
            navigate(constants.page_home);
        }                 
    };
   
    useEffect(() => { checkLogined();}, []);
    useEffect(() => { checkInRoles();}, []);
        
    return(<div></div>)
}