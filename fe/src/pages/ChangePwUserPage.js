import React, { Component } from 'react';
import ChangePwUserComponent from '../components/ChangePwUserComponent';
import NavbarComponent from '../components/NavbarComponent';


class ChangePwUserPage extends Component {
    render() {
        return(
            <div>
              <NavbarComponent />
              <ChangePwUserComponent />
            </div>
        )
      };
    };
  export default ChangePwUserPage;