import React, { Component } from 'react';
import AnnouncementComponent from '../components/AnnouncementComponent';
import NavbarComponent from '../components/NavbarComponent';


class AnnouncementPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />
            <AnnouncementComponent />
          </div>
        )
      };
    };
  export default AnnouncementPage;