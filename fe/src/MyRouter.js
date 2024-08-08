import React, { Component } from 'react';
import { Route, HashRouter as Router, Routes } from 'react-router-dom';
import './App.css';
import * as constants from './jscode/constants';
import Layout from './Layout';
import ContactUsPage from './pages/ContactUsPage';
import CoursesInfoPage from './pages/CoursesInfoPage';
import HomeAdminPage from './pages/HomeAdminPage';
import HomePage from './pages/HomePage';
import HomeUserPage from './pages/HomeUserPage';
import LoginPage from './pages/LoginPage';
import LogoutPage from './pages/LogoutPage';
import RegisterPage from './pages/RegisterPage';


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
            <Route path= {constants.page_home_user} element={<HomeUserPage />} />
            <Route path= {constants.page_home_admin} element={<HomeAdminPage />} />
            <Route path= {constants.page_courses_info} element={<CoursesInfoPage />} />
          </Route>          
        </Routes>
      </Router>
    )
  };
};
export default MyRouter;
