import React from "react";
import * as constants from "../jscode/constants";

export function MessageComponent(props){
    if (props.show == null) 
        props.show = true;
    if (props.success == null) 
        props.success = true;
    if (props.message == null)
        props.message = constants.string_empty;    
    let colorMes = props.success ? "white" : "red";
    let isShow = props.show;
    let isDisplay = isShow ? 'inline' : 'none';
    let mes = props.message;
    return(
        <div style={{display: isDisplay, color: colorMes, marginTop: 25}}>
            {mes}
        </div>
    )
  };