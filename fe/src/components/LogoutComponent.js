import axios from 'axios';
import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

export default function LogoutComponent() {   
    const navigate = useNavigate();
    const logout = async () => { 
        let tokenString = localStorage.getItem(constants.token_string);
        utils.initStorage();
        if (!utils.isNullOrEmpty(tokenString)){
            const logoutEntity = {
                token: tokenString
            };

            await axios.post(constants.api_auth_logout, logoutEntity)
            .then(res => {                
                utils.initStorage();
                
            })
            .catch(error => {
                console.log("Error: ", error);
            });
        }
        navigate(constants.page_home); 
       
    };
    useEffect(() => { logout();}, []);
    return(
        <div>
        </div>
    )
}

