import axios from 'axios';
import React, { createContext, useEffect, useState } from 'react';
import MyRouter from './MyRouter';

export const IntroduceContext = createContext();

export default function ParentPage() { 
    const [introduceInfo, setIntroduceInfo] = useState({});
    const getIntroduceInfo = async () => {
        const response = await axios.get(
        "/introduce"
        );
        setIntroduceInfo(response.data.result);
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
