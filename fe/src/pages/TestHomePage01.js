import React, { Component } from 'react';
import TestGetItem01 from '../components/TestGetItem01';
import TestGetItemList01 from '../components/TestGetItemList01';


class TestHomePage01 extends Component {
    render() {
        return(
          <div className="App">
            <h1>Hello World</h1>
            <TestGetItem01 />
            <TestGetItemList01 />
          </div>
        )
      };
    };
  export default TestHomePage01;


