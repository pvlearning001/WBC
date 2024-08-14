import React, { Component } from 'react';
import { AdminMgmtMessagesComponent } from '../components/AdminMgmtMessagesComponent';
import NavbarAdminComponent from '../components/NavbarAdminComponent';


class AdminMgmtMessages extends Component {
    render() {
        return(
          <div>
            <NavbarAdminComponent />
            <AdminMgmtMessagesComponent text="QUẢN TRỊ THÔNG BÁO" />
          </div>
        )
      };
    };
  export default AdminMgmtMessages;