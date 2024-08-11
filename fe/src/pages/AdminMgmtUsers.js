import React, { Component } from 'react';
import AdminMngtUserComponent from '../components/AdminMngtUserComponent';
import NavbarAdminComponent from '../components/NavbarAdminComponent';


class AdminMgmtUsers extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <AdminMngtUserComponent />
          </div>
        )
      };
    };
  export default AdminMgmtUsers;