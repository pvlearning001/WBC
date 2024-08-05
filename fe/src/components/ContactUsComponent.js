import React, { useContext } from "react";
import '../assets/css/main.css';
import { IntroduceContext } from "../ParentPage";

export default function HomeMainComponent() { 
  const introduceInfo = useContext(IntroduceContext); 

  return (
    <main className="main">
    <section id="hero" className="hero section dark-background">
      <div className="container">
        <div className="row gy-4">
          <div className="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-top">
            <p>Địa chỉ: { introduceInfo.info04 }</p> 
            <p>Số điện thoại: { introduceInfo.info05 }</p> 		
            <p>Email: { introduceInfo.info06 }</p> 	
          </div>
          <div className="col-lg-6 order-1 order-lg-2 hero-img">
          </div>
        </div>
      </div>
    </section>
  </main>
  )
}