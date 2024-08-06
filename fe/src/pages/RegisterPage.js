import React, { Component } from 'react';
import NavbarComponent from '../components/NavbarComponent';
import RegisterComponent from '../components/RegisterComponent';


class RegisterPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />  
            <RegisterComponent />
          </div>
        )
      };
    };
  export default RegisterPage;