import axios from 'axios';
import { jwtDecode } from "jwt-decode";
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/page.css';
/*********************************
 * https://github.com/auth0/jwt-decode
 */

export default function LoginComponent() {
    const boxheader = {
        marginTop: 40,
    };

    const [un, setUn] = useState(""); 
    const [pw, setPw] = useState("");
    const [isLogined, setIsLogined] = useState(false); 

    const login = async () => {
        if ((un !== "") 
            && (pw !== "")){
            console.log(un);
            console.log(pw);
            const loginUser = {
                userName: un,
                password: pw
            };

            await axios.post('/auth/token', loginUser)
            .then(res => {
                console.log(res.data.code);
                if (res.data.code === 1000){
                    setIsLogined(true);
                    console.log(res.data.result.token);
                    console.log(isLogined);
                    const decoded = jwtDecode(res.data.result.token);
                    console.log(decoded);
                    console.log(`IAT: ${new Date(decoded.iat * 1000)}`);
                    console.log(`EXP: ${new Date(decoded.exp * 1000)}`);
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