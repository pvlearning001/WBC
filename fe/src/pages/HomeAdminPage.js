import React, { Component } from 'react';
import HomeAdminComponent from '../components/HomeAdminComponent';
import NavbarComponent from '../components/NavbarComponent';


class HomeAdminPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />
            <HomeAdminComponent />
          </div>
        )
      };
    };
  export default HomeAdminPage;