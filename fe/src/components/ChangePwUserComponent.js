import axios from 'axios';
import React, { useState } from 'react';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";
import { MessageComponent } from './MessageComponent';

export default function ChangePwUserComponent() {
    const [un, setUn] = useState(constants.string_empty); 
    const [pwOld, setPwOld] = useState(constants.string_empty);
    const [pwNew, setPwNew] = useState(constants.string_empty);
    const [pwNewRT, setPwNewRT] = useState(constants.string_empty);
    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(true);

    const changePw = async() =>{
        setSuccess(true);
        setMessage(constants.string_empty);
        if ((un !== constants.string_empty)
            && (pwOld !== constants.string_empty)
            && (pwNew !== constants.string_empty)
            && (pwNewRT !== constants.string_empty)){
            if (utils.isPwMatch(pwNew, pwNewRT)){ 
                const changePwInfo = {
                    userName: un,
                    pwOld: pwOld,
                    pwNew: pwNew
                };
                await axios.put(constants.api_changePw_user, changePwInfo)
                .then(res => {                
                    setMessage("Changed password success...");
                    setSuccess(true);
                })
                .catch(error => {
                    console.log("Error: ", error.response.data.message);
                    console.log("Error: ", error.response.data.code);
                    setMessage(error.response.data.message);
                    setSuccess(false);
                });
            }
            else{
                setSuccess(false);
                setMessage('Password và Password nhập lại phải giống nhau');
            }
        }
        else{
            setSuccess(false);
            setMessage('Bạn nên nhập đầy đủ thông tin');
        }
    }

    return(
        <div className="container">
            <div className="row">
                <div className="col-sm-12 col-md-12 col-lg-12">
                    <div className="card login-content shadow-lg border-0">
                        <div className="card-body text-center">
                            <h3 className="text-logo">{constants.text_User_ChangePw}</h3>
                            <br />
                            <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" onChange={(e) => setUn(e.target.value)} />
                            <br />
                            <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password cu" onChange={(e) => setPwOld(e.target.value)} />
                            
                            <br />
                            <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password moi" onChange={(e) => setPwNew(e.target.value)} />
                            
                            <br />
                            <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password moi xac nhan" onChange={(e) => setPwNewRT(e.target.value)} />

                            <br />
                            <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit" onClick={changePw}>{constants.text_User_ChangePw}</button>
                            <br />
                            <br />
                            <MessageComponent show={true} message={message} success={success} />                                          
                        </div>
                    </div>
        
                </div>
            </div>
        </div>
            )
}