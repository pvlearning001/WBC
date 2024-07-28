import React, { Component } from 'react';
import { Route, HashRouter as Router, Routes } from 'react-router-dom';
import './App.css';
import Layout from './Layout';
import ContactUsPage from './pages/ContactUsPage';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';

import TestPage01 from './pages/TestPage01';
import TestPage02 from './pages/TestPage02';
import TestPage03 from './pages/TestPage03';

class App extends Component {
  render() {
    return(
      <Router>
        <Routes>
          <Route element={<Layout/>}>
            <Route path="/" element={<HomePage />} />
            <Route path="/contactus" element={<ContactUsPage />} />
            <Route path="/login" element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
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
