import React from 'react';

export default function RegisterComponent() {
    const boxheader = {
        marginTop: 40,
    };
    
    return(
<div className="container">
    <div className="row">
        <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="card login-content shadow-lg border-0">
                <div style={boxheader} className="card-body text-center">
                    <h3 className="text-logo">Register</h3>
                    <br />
                    <input className="form-control border-0" type="" name="fullName" placeholder="Ho va Ten" />
                    <br />
                    <input className="form-control border-0" type="" name="userName" placeholder="Nhap vao Username" />
                    <br />
                    <input className="form-control border-0" type="password" name="password" placeholder="Nhap vao Password" />
                    <br />
                    <button className="btn btn-primary btn-sm border-0 btn-login" type="submit" name="submit">Register</button>
                    
                                           
                </div>
            </div>

        </div>
    </div>
</div>
    )
}