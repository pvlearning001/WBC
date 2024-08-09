import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

export default function LogoutComponent() {
    const navigate = useNavigate();
    const logout = () => {
        utils.initStorage();
        navigate(constants.page_home); 
    };
    useEffect(() => { logout();}, []);
    return(
        <div>
        </div>
    )
}

