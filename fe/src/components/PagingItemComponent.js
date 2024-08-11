import React from "react";
import { Link } from 'react-router-dom';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";


export function PagingItemComponent(props){
    let isAllow = true;
    isAllow = (props.show !== constants.bool_false);
    isAllow = isAllow 
        ? utils.isAllowControl(props.roles)
        : isAllow;
    let isDisplay = isAllow ? 'inline' : 'none';
    return(
        <li style={{display: isDisplay}}>
            <Link to={props.link} className={props.css}>{props.text}</Link>
        </li>
    )
  };