import React, { Component } from 'react';
import NavbarUserComponent from '../components/NavbarUserComponent';
import { TempComponent } from '../components/TempComponent';


class UserViewMessages extends Component {
    render() {
        return(
          <div>
            <NavbarUserComponent />
            <TempComponent text="User mngt view message." />
          </div>
        )
      };
    };
  export default UserViewMessages;