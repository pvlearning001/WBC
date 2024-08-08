import React, { Component } from 'react';
import NavbarUserComponent from '../components/NavbarUserComponent';
import { TempComponent } from '../components/TempComponent';


class UserReviewMark extends Component {
    render() {
        return(
          <div>
            <NavbarUserComponent />
            <TempComponent text="User mngt personal info." />
          </div>
        )
      };
    };
  export default UserReviewMark;