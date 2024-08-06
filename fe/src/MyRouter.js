import React, { Component } from 'react';
import { Route, HashRouter as Router, Routes } from 'react-router-dom';
import './App.css';
import * as constants from './jscode/constants';
import Layout from './Layout';
import ContactUsPage from './pages/ContactUsPage';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import LogoutPage from './pages/LogoutPage';
import RegisterPage from './pages/RegisterPage';
import TestHomePage01 from "./pages/TestHomePage01";
import TestPage01 from './pages/TestPage01';
import TestPage02 from './pages/TestPage02';
import TestPage03 from './pages/TestPage03';


class MyRouter extends Component {
  render() {
    return(
      <Router>
        <Routes>
          <Route element={<Layout/>}>
            <Route path= {constants.page_home} element={<HomePage />} />
            <Route path= {constants.page_contactus} element={<ContactUsPage />} />
            <Route path= {constants.page_login} element={<LoginPage />} />
            <Route path= {constants.page_logout} element={<LogoutPage />} />
            <Route path= {constants.page_register} element={<RegisterPage />} />
            <Route path= {constants.page_page01} element={<TestPage01 />} />
            <Route path= {constants.page_page02} element={<TestPage02 />} />
            <Route path= {constants.page_page03} element={<TestPage03 />} />
            <Route path= {constants.page_testhomepage01} element={<TestHomePage01 />} />
          </Route>          
        </Routes>
      </Router>
    )
  };
};
export default MyRouter;
