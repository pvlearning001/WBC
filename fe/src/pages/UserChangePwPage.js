import React, { Component } from 'react';
import NavbarUserComponent from '../components/NavbarUserComponent';
import { TempComponent } from '../components/TempComponent';


class UserChangePwPage extends Component {
    render() {
        return(
          <div>
            <NavbarUserComponent />
            <TempComponent text="User change pw here" />
          </div>
        )
      };
    };
  export default UserChangePwPage;