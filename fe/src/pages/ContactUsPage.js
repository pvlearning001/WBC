import React, { Component } from 'react';
import ContactUsComponent from '../components/ContactUsComponent';
import NavbarComponent from '../components/NavbarComponent';


class ContactUsPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />
            <ContactUsComponent />
          </div>
        )
      };
    };
  export default ContactUsPage;