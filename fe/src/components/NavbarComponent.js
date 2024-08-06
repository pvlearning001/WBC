import React from "react";
import NavbarLoginedComponent from "./NavbarLoginedComponent";
import NavbarNotLoginComponent from "./NavbarNotLoginComponent";

import * as constants from "../jscode/constants";


export default function NavbarComponent() {
    let isLogined = localStorage.getItem(constants.token_isAuthenticated);
    console.log("", isLogined);
    if (isLogined === "true") {
        console.log("Logined");
        return <NavbarLoginedComponent />

    }
    else {
        console.log("Not Logined");
        return <NavbarNotLoginComponent />
    }
}