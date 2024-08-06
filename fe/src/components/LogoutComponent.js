import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";

export default function LogoutComponent() {
    const navigate = useNavigate();
    const logout = () => {
        localStorage.setItem(constants.token_isAuthenticated, false);
        localStorage.setItem(constants.token_string, constants.string_empty);
        localStorage.setItem(constants.token_userName, constants.string_empty);
        localStorage.setItem(constants.token_role, constants.string_empty);
        localStorage.setItem(constants.token_expTime, 0); 
        navigate(constants.page_home); 
    };
    useEffect(() => { logout();}, []);
    return(
        <div>
        </div>
    )
}

