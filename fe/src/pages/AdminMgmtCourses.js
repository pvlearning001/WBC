import React, { Component } from 'react';
import NavbarAdminComponent from '../components/NavbarAdminComponent';
import { TempComponent } from '../components/TempComponent';


class AdminMgmtCourses extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <TempComponent text="Management Courses Page" />
          </div>
        )
      };
    };
  export default AdminMgmtCourses;