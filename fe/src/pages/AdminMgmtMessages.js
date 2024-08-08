import React, { Component } from 'react';
import NavbarAdminComponent from '../components/NavbarAdminComponent';
import { TempComponent } from '../components/TempComponent';


class AdminMgmtMessages extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <TempComponent text="Management Messages Page" />
          </div>
        )
      };
    };
  export default AdminMgmtMessages;