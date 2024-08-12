import axios from 'axios';
import React, { useState } from 'react';
import '../assets/css/page.css';
import * as constants from '../jscode/constants';


export function UserInfoComponent(props){
    const [files, setFiles] = useState(null); 
    const token = localStorage.getItem(constants.token_string);
    function handleFile(event) {
        let files = event.target.files;
        setFiles(files); 
    }

    function handleFileUpload(event) {
        // get the selected file from the input
        const filesUpload = files;
        // create a new FormData object and append the file to it
        const formData = new FormData();
        for (const file of filesUpload)
            formData.append('files', file);
        //formData.append("files", filesUpload);
        // make a POST request to the File Upload API with the FormData object and Rapid API headers
        axios({ 
            // Endpoint to send files 
            url: "/upload/images", 
            method: "POST", 
            headers: {
                "Authorization" : `Bearer ${token}`,
                "Content-Type": "multipart/form-data",
            }, 
            // Attaching the form data 
            data: formData, 
          }) 
            .then((res) => { }) // Handle the response from backend here 
            .catch((err) => { }); // Catch errors if any
        }   

    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">
                    <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">
                        <h5>{props.text}</h5>
                        <div>
                            <input multiple="multiple" type="file" onChange={(e) => handleFile(e)}  />
                            <br />
                            <button onClick={(e) => handleFileUpload(e)}>Send Files</button> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
    )
  };