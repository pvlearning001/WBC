import React, { Component } from 'react';
import HomeAdminComponent from '../components/HomeAdminComponent';
import NavbarAdminComponent from '../components/NavbarAdminComponent';


class HomeAdminPage extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <HomeAdminComponent />
          </div>
        )
      };
    };
  export default HomeAdminPage;