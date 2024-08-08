import React from "react";
import * as utils from "../jscode/utilities";


export function ErrMesComponent(props){
    let isShow = props.show;
    isShow = !utils.isNullOrEmpty(props.text);
    let isDisplay = isShow ? 'inline' : 'none';
    return(
        <div style={{display: isDisplay, color: "red", marginTop: 30}}>
            {props.text}
        </div>
    )
  };