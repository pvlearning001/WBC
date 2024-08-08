import axios from 'axios';
import { jwtDecode } from "jwt-decode";
import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import { ErrMesComponent } from './ErrorMessageComponent';
/*********************************
 * https://github.com/auth0/jwt-decode
 */

export default function LoginComponent() {

    const [un, setUn] = useState(constants.string_empty); 
    const [pw, setPw] = useState(constants.string_empty);
    const [err, setErr] = useState(constants.string_empty);
    const navigate = useNavigate();

    const login = async () => {
        setErr(constants.string_empty);
        if ((un !== "") 
            && (pw !== "")){
            const loginUser = {
                userName: un,
                password: pw
            };
            
            await axios.post('/auth/token', loginUser)
            .then(res => {                
                if (res.data.code === 1000){
                    const decoded = jwtDecode(res.data.result.token);                    
                    localStorage.setItem(constants.token_isAuthenticated, true);
                    localStorage.setItem(constants.token_string, res.data.result.token);
                    localStorage.setItem(constants.token_userName, decoded.sub);
                    localStorage.setItem(constants.token_role, decoded.scope);
                    localStorage.setItem(constants.token_expTime, decoded.exp);
                    localStorage.setItem(constants.token_fullName, decoded.fullName);
                    localStorage.setItem(constants.token_userId, decoded.userId);               
                    navigate(constants.page_home); 
                }
                else{
                    setErr(res.data.message);
                    console.log("Error: ", res.data.message);
                    navigate(constants.page_home); 
                }
            })
            .catch(error => {
                console.log("Error: ", error.response.data.message);
                setErr(error.response.data.message);
            });
        }
    };
    useEffect(() => { login();}, []);

    return(
<div className="container">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card login-content shadow-lg border-0">
                <div className="card-body text-center">
                    <h3 className="text-logo">Sign In</h3>
                    <br />
                    <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" onChange={(e) => setUn(e.target.value)} />
                    <br />
                    <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password" onChange={(e) => setPw(e.target.value)} />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit" onClick={login}>Sign In</button>
                    <br />
                    <br />
                    <ErrMesComponent show="true" text={err} />
                    
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
}

