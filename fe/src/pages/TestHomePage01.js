import React from 'react';
import NavbarComponent from '../components/NavbarComponent';
import TestGetItem01 from '../components/TestGetItem01';
import TestGetItemList01 from '../components/TestGetItemList01';


export default function TestHomePage01() {
    return(
      <div>
        <NavbarComponent />
        <div className="container-fluid">
          <div className="row">
            <h1>Hello World</h1>
            <TestGetItem01 />
            <TestGetItemList01 />
          </div>
        </div>
      </div>
    )
}


