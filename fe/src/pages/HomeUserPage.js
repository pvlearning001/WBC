import React, { Component } from 'react';
import HomeUserComponent from '../components/HomeUserComponent';
import NavbarUserComponent from '../components/NavbarUserComponent';


class HomeUserPage extends Component {
    render() {
        return(
          <div>
            <NavbarUserComponent />
            <HomeUserComponent />
          </div>
        )
      };
    };
  export default HomeUserPage;