import React, { Component } from 'react';
import NavbarUserComponent from '../components/NavbarUserComponent';
import { UserInfoComponent } from '../components/UserInfoComponent';


class UserInfoPage extends Component {
    render() {
        return(
          <div>
            <NavbarUserComponent />
            <UserInfoComponent />
          </div>
        )
      };
    };
  export default UserInfoPage;