import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/page.css';

class LoginComponent extends Component {
    render() {
        return(

<div className="container">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card login-content shadow-lg border-0">
                <div className="card-body text-center">
                    <h3 className="text-logo">Sign In</h3>
                    <br />
                    
                    <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" />
                    <br />
                    <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password" />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit">Sign In</button>
                    <div className="nomember">
                        <p className="text-center">
                            Not a member?
                            <Link to="/register">Create an Account</Link>
                        </p>
                    </div>
                                           
                </div>
            </div>

        </div>
    </div>
</div>
        )
      };
    };
  export default LoginComponent;