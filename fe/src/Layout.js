import React, { Component } from 'react';
import { Outlet } from 'react-router-dom';
import NavbarComponent from './components/NavbarComponent';

class Layout extends Component {
  render() {
    return(
      <>
        <NavbarComponent />
        <main>
            <Outlet />
        </main>
      </>
    )
  };
};
export default Layout;