import axios from 'axios';
import React, { createContext, useEffect, useState } from 'react';
import MyRouter from './MyRouter';
import * as constants from "./jscode/constants";
import * as intro from "./jscode/introInfo";

export const IntroduceContext = createContext();

let introduceInfoInit = {
    "info01": intro.text_Intro_Company_Name,
    "info02": intro.text_Intro_Home_Line01,
    "info03": intro.text_Intro_Home_Line02,
    "info04": intro.text_Intro_Contact_Addr,
    "info05": intro.text_Intro_Contact_Phone,
    "info06": intro.text_Intro_Contact_Email
}

export default function ParentPage() { 
    const [introduceInfo, setIntroduceInfo] = useState(introduceInfoInit);
    const getIntroduceInfo = async () => {
        if (constants.load_Intro_Info_Way === constants.load_Intro_Info_By_DB){
            const response = await axios.get(constants.api_introduce);
            setIntroduceInfo(response.data.result);
        }
    };
    useEffect(() => {
        getIntroduceInfo();
    }, []);
    

    return(
        <IntroduceContext.Provider value={introduceInfo}>
            <MyRouter />
        </IntroduceContext.Provider>
    )
}
