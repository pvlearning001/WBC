import React, { Component } from 'react';
import '../assets/css/main.css';
import imgOrgChart from "../assets/img/hero-img.png";

class HomeMainComponent extends Component {
    render() {
        return(  
<main className="main">
    <section id="hero" className="hero section dark-background">
      <div className="container">
        <div className="row gy-4">
          <div className="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <p>
				Tháng 02/2002, Trung tâm bồi dưỡng cán bộ Thuế (tiền thân của Trường Nghiệp vụ Thuế) được thành lập theo Quyết định số 36/2002/QĐ-BTC ngày 20/03/2002 của Bộ trưởng Bộ Tài chính.
			</p> 
			<p>
				Hiện nay, chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Trường Nghiệp vụ Thuế được quy định tại Quyết định số 2157/QĐ-BTC ngày 15/11/2018 của Bộ trưởng Bộ Tài chính. Theo đó, Trường Nghiệp vụ Thuế là đơn vị thuộc Tổng cục thuế, Bộ Tài chính, có trụ sở tại Hà Nội và 01 Phân hiệu tại Thừa Thiên - Huế. Trường Nghiệp vụ Thuế có tư cách pháp nhân, con dấu riêng, được mở tài khoản tại Kho bạc Nhà nước và Ngân hàng theo quy định của pháp luật.
			</p>		
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
      };
    };
  export default HomeMainComponent;