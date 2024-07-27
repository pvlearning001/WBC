import React, { Component } from 'react';
import { Route, HashRouter as Router, Routes } from 'react-router-dom';
import './App.css';
import Layout from './Layout';
import TestHomePage01 from './pages/TestHomePage01';
import TestPage01 from './pages/TestPage01';
import TestPage02 from './pages/TestPage02';
import TestPage03 from './pages/TestPage03';

class App extends Component {
  render() {
    return(
      <Router>
        <Routes>
          <Route element={<Layout/>}>
            <Route path="/" element={<TestHomePage01 />} />
            <Route path="/page01" element={<TestPage01 />} />
            <Route path="/page02" element={<TestPage02 />} />
            <Route path="/page03" element={<TestPage03 />} />
          </Route>          
        </Routes>
      </Router>
    )
  };
};
export default App;
