import React, { Component } from 'react';
import HomeUserComponent from '../components/HomeUserComponent';
import NavbarComponent from '../components/NavbarComponent';


class HomeUserPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />
            <HomeUserComponent />
          </div>
        )
      };
    };
  export default HomeUserPage;