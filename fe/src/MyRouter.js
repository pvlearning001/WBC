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

import AdminMgmtCourses from './pages/AdminMgmtCourses';
import AdminMgmtMarks from './pages/AdminMgmtMarks';
import AdminMgmtMessages from './pages/AdminMgmtMessages';
import AdminMgmtUsers from './pages/AdminMgmtUsers';
import UserChangePwPage from './pages/UserChangePwPage';
import UserInfoPage from './pages/UserInfoPage';
import UserRegisterCourses from './pages/UserRegisterCourses';
import UserReviewMarks from './pages/UserReviewMarks';
import UserViewMessages from './pages/UserViewMessages';

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

            <Route path= {constants.page_admin_courses} element={<AdminMgmtCourses />} />
            <Route path= {constants.page_admin_marks} element={<AdminMgmtMarks />} />
            <Route path= {constants.page_admin_messages} element={<AdminMgmtMessages />} />
            <Route path= {constants.page_admin_users} element={<AdminMgmtUsers />} />
            <Route path= {constants.page_user_changepw} element={<UserChangePwPage />} />
            <Route path= {constants.page_user_info} element={<UserInfoPage />} />
            <Route path= {constants.page_user_courses} element={<UserRegisterCourses />} />
            <Route path= {constants.page_user_marks} element={<UserReviewMarks />} />
            <Route path= {constants.page_user_messages} element={<UserViewMessages />} />
          </Route>          
        </Routes>
      </Router>
    )
  };
};
export default MyRouter;
