import React, { useContext } from 'react';
import '../assets/css/main.css';
import { IntroduceContext } from "../ParentPage";

export default function ContactUsComponent() {
  const introduceInfo = useContext(IntroduceContext); 
  return(  
<main className="main">
    <section id="hero" className="hero section dark-background">
      <div className="container">
        <div className="row">
            Địa chỉ: {introduceInfo.info04}
        </div>
        <div className="row">
            Số điện thoại: {introduceInfo.info05}
        </div>
        <div className="row">
            Email: {introduceInfo.info06}
        </div>
      </div>
    </section>
  </main>
  )
}