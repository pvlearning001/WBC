import React, { Component } from 'react';
import HomeMainComponent from '../components/HomeMainComponent';
import NavbarComponent from '../components/NavbarComponent';


class HomePage extends Component {  
    render() {
        return(
          <div>
            <NavbarComponent />  
            <HomeMainComponent />
          </div>
        )
      };
    };
  export default HomePage;