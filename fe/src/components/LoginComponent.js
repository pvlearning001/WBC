import React, { Component } from 'react';
import '../assets/css/login.css';

class LoginComponent extends Component {
    render() {
        return(

<div className="container">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card login-content shadow-lg border-0">
                <div className="card-body">
                    <div className="text-center">
                        
                    </div>
                    <h3 className="text-logo">Sign In</h3>
                    <br />
                    
                        <input className="form-control border-0" type="" name="" placeholder="Type Your Username" />
                        <br />
                        <input className="form-control border-0" type="" name="" placeholder="Type Your Password" />
                        <br />
                        <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit">Sign In</button>
                                           
                </div>
            </div>

        </div>
    </div>
</div>
        )
      };
    };
  export default LoginComponent;