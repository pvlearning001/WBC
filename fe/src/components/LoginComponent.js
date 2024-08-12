import axios from 'axios';
import { jwtDecode } from "jwt-decode";
import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import { MessageComponent } from './MessageComponent';
/*********************************
 * https://github.com/auth0/jwt-decode
 */

export default function LoginComponent() {

    const [un, setUn] = useState(constants.string_empty); 
    const [pw, setPw] = useState(constants.string_empty);
    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(true);
    const navigate = useNavigate();

    const login = async () => {
        setSuccess(true);
        setMessage(constants.string_empty);

        if ((un !== "") 
            && (pw !== "")){
            const loginUser = {
                userName: un,
                password: pw
            };
            
            await axios.post(constants.api_auth_token, loginUser)
            .then(res => {
                const decoded = jwtDecode(res.data.result.token);                

                localStorage.setItem(constants.token_isAuthenticated, true);
                localStorage.setItem(constants.token_string, res.data.result.token);
                localStorage.setItem(constants.token_userName, decoded.sub);
                localStorage.setItem(constants.token_role, decoded.scope);
                localStorage.setItem(constants.token_expTime, decoded.exp*1000);
                localStorage.setItem(constants.token_fullName, decoded.fullName);
                localStorage.setItem(constants.token_userId, decoded.userId);               
                setMessage(res.data.message);
                setSuccess(false);
                navigate(constants.page_home);
            })
            .catch(error => {
                console.log("Error: ", error.response.data.message);
                setMessage(error.response.data.message);
                setSuccess(false);
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
                    <h3 className="text-logo">{constants.text_User_Signin}</h3>
                    <br />
                    <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" onChange={(e) => setUn(e.target.value)} />
                    <br />
                    <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password" onChange={(e) => setPw(e.target.value)} />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit" onClick={login}>{constants.text_User_Signin}</button>
                    <br />
                    <br />
                    <MessageComponent show={true} message={message} success={success} />
                    
                    <div className="nomember">
                        <p className="text-center">
                            <Link to="/register">{constants.linkText_createAccount}</Link>
                        </p>
                    </div>                                           
                </div>
            </div>

        </div>
    </div>
</div>
    )
}

