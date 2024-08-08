import axios from 'axios';
import React, { useEffect, useState } from 'react';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";
import { MessageComponent } from './MessageComponent';

export default function RegisterComponent() {

    const [fullName, setFullName] = useState(constants.string_empty); 
    const [fName, setFName] = useState(constants.string_empty); 
    const [mName, setMName] = useState(constants.string_empty); 
    const [lName, setLName] = useState(constants.string_empty); 
    const [un, setUn] = useState(constants.string_empty); 
    const [pw, setPw] = useState(constants.string_empty);
    const [pwRT, setPwRT] = useState(constants.string_empty);
    const [email, setEmail] = useState(constants.string_empty);
    const [phone, setPhone] = useState(constants.string_empty);    
    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(constants.bool_true);

    const parseName = (text) => {
        setFullName(text);
        const nameArr = utils.getDetailsName(text);
        setFName(nameArr[0]);
        setMName(nameArr[1]);
        setLName(nameArr[2]);
    }

    const register = async () => {
        setMessage(constants.string_empty);
        setSuccess(true);
        if ((un !== "")){
            if (utils.isPwMatch(pw, pwRT)){  
                const registerUser = {
                    userName: un,
                    password: pw,
                    firstName: fName,
                    middleName: mName,
                    lastName: lName,
                    email: email,
                    phone: phone
                };
                console.log(registerUser);
                
                await axios.post(constants.api_register_user, registerUser)
                .then(res => {                
                    setMessage("Register success...");
                    setSuccess(true);
                })
                .catch(error => {
                    console.log("Error: ", error.response.data.message);
                    setMessage(error.response.data.message);
                    setSuccess(false);
                });
            }
            else{
                setMessage('Password and Password retype is NOT match');
                setSuccess(false);
            }
        }
    };
    useEffect(() => { register();}, []);
    useEffect(() => { parseName(constants.string_empty); }, []);
    
    return(
<div className="container-fluid">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card register-content shadow-lg border-0">
                <div className="card-body text-center">
                    <h3 className="text-logo">{constants.text_User_Register}</h3>
                    <input className="register-form-control border-0" type="" name="fullName" placeholder="Ho va Ten"  onChange={(e) => parseName(e.target.value)} />
                    <br />
                    <input className="register-form-control border-0" type="" name="userName" placeholder="Nhap vao Username"  onChange={(e) => setUn(e.target.value)} />
                    <br />
                    <input className="register-form-control border-0" type="" name="email" placeholder="Nhap vao Email"  onChange={(e) => setEmail(e.target.value)} />
                    <br />
                    <input className="register-form-control border-0" type="" name="phone" placeholder="Nhap vao so phone"  onChange={(e) => setPhone(e.target.value)} />
                    <br />
                    <input className="register-form-control border-0" type="password" name="password" placeholder="Nhap vao Password"  onChange={(e) => setPw(e.target.value)} />
                    <br />
                    <input className="register-form-control border-0" type="password" name="passwordReType" placeholder="Password xac nhan"  onChange={(e) => setPwRT(e.target.value)} />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit" onClick={register}>{constants.text_User_Register}</button>
                    <br />
                    <MessageComponent show={true} message={message} success={success} />
                </div>
            </div>

        </div>
    </div>
</div>
    )
}