import axios from 'axios';
import { jwtDecode } from "jwt-decode";
import React, { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
/*********************************
 * https://github.com/auth0/jwt-decode
 */

export default function LoginComponent() {
    const boxheader = {
        marginTop: 40,
    };

    const [un, setUn] = useState(""); 
    const [pw, setPw] = useState("");
    const navigate = useNavigate();

    const login = async () => {
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
                    navigate(constants.page_home); 
                }
            })
            .catch(error => console.log("Error: ", error));
        }
    };
    useEffect(() => { login();}, []);

    return(
<div className="container">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card login-content shadow-lg border-0">
                <div style={boxheader} className="card-body text-center">
                    <h3 className="text-logo">Sign In</h3>
                    <br />
                    <div style={{color: 'white'}}>{un}</div>
                    <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" onChange={(e) => setUn(e.target.value)} />
                    <br />
                    <div style={{color: 'white'}}>{pw}</div>
                    <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password" onChange={(e) => setPw(e.target.value)} />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit" onClick={login}>Sign In</button>
                    
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

