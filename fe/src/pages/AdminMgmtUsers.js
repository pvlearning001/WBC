import React, { Component } from 'react';
import NavbarAdminComponent from '../components/NavbarAdminComponent';
import { TempComponent } from '../components/TempComponent';


class AdminMgmtUsers extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <TempComponent text="Management Users Page" />
          </div>
        )
      };
    };
  export default AdminMgmtUsers;