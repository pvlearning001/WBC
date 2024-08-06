import React, { useEffect } from "react";
import { useLocation, useNavigate } from 'react-router-dom';
import '../assets/css/main.css';
import * as constants from "../jscode/constants";

export default function CheckLoginedComponent() {
    const isLoginedString = localStorage.getItem(constants.token_isAuthenticated);
    const isLogined = (isLoginedString === "true");
    const navigate = useNavigate();
    const location = useLocation();
    //console.log(roleArray);
    
    const checkLogined = () => {      
        if (!isLogined) {            
            navigate(constants.page_home);
        }         
    };

    const checkInRoles = () => {        
        const roleString = localStorage.getItem(constants.token_role);
        const roleArray = roleString.split(constants.string_space);
        let isRole = false;

        for (const role of roleArray) { 
            if (role === constants.role_user) {
                isRole = (constants.page_list_user.indexOf(location.pathname) > -1);                
            }

            if (role === constants.role_admin) {
                isRole = (constants.page_list_admin.indexOf(location.pathname) > -1);                
            }

            if (isRole){
                break;
            }
        }
        if (!isRole) {            
            navigate(constants.page_home);
        }  
                 
    };
   
    useEffect(() => { checkLogined();}, []);
    useEffect(() => { checkInRoles();}, []);
        
    return(<div></div>)
}