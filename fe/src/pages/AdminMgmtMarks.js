import React, { Component } from 'react';
import NavbarAdminComponent from '../components/NavbarAdminComponent';
import { TempComponent } from '../components/TempComponent';


class AdminMgmtMarks extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <TempComponent text="Management Marks Page" />
          </div>
        )
      };
    };
  export default AdminMgmtMarks;