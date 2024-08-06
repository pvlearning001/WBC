import React from "react";
import NavbarLoginedComponent from "./NavbarLoginedComponent";
import NavbarNotLoginComponent from "./NavbarNotLoginComponent";

import * as constants from "../jscode/constants";


export default function NavbarComponent() {
    let isLoginedString = localStorage.getItem(constants.token_isAuthenticated);
    let isLogined = (isLoginedString === "true");

    if (isLogined) {
        return <NavbarLoginedComponent />        
    }
    else {
        return <NavbarNotLoginComponent />
    }
}