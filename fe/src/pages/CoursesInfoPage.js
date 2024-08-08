import React, { Component } from 'react';
import CoursesInfoComponent from '../components/CoursesInfoComponent';
import NavbarComponent from '../components/NavbarComponent';


class CoursesInfoPage extends Component {
    render() {
        return(
          <div>
            <NavbarComponent />
            <CoursesInfoComponent />
          </div>
        )
      };
    };
  export default CoursesInfoPage;