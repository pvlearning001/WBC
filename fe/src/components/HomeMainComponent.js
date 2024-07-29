import React, { useContext } from "react";
import '../assets/css/main.css';
import imgOrgChart from "../assets/img/hero-img.png";
import { IntroduceContext } from "../ParentPage";

export default function HomeMainComponent() { 
  const introduceInfo = useContext(IntroduceContext); 
  return (
    <main className="main">
    <section id="hero" className="hero section dark-background">
      <div className="container">
        <div className="row gy-4">
          <div className="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <p>{ introduceInfo.info02 }</p> 
            <p>{ introduceInfo.info03 }</p> 		
          </div>
          <div className="col-lg-6 order-1 order-lg-2 hero-img">
            <img src="assets/img/hero-img.png" className="img-fluid animated" alt="" />
            <img src={imgOrgChart} alt="So do to chuc"/>
          </div>
        </div>
      </div>
    </section>
  </main>
  )
}