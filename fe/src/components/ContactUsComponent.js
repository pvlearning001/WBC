import React, { useContext } from "react";
import '../assets/css/main.css';
import * as constants from "../jscode/constants";
import { IntroduceContext } from "../ParentPage";

export default function HomeMainComponent() { 
  const introduceInfo = useContext(IntroduceContext); 
  let addr = constants.text_Intro_Addr + introduceInfo.info04;
  let phoneNo = constants.text_Intro_Phone_No + introduceInfo.info05;
  let email = constants.text_Intro_Email + introduceInfo.info06;

  return (
    <main className="main hero section dark-background">
      <div className="container">
        <div className="row gy-4">
          <div className="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-top">
            <p>{ addr }</p> 
            <p>{ phoneNo }</p> 		
            <p>{ email }</p> 	
          </div>
          <div className="col-lg-6 order-1 order-lg-2 hero-img">
          </div>
        </div>
      </div>
    </main>
  )
}