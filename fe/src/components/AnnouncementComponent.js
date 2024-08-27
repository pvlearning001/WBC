import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

export default function AnnouncementComponent() {  
    const [announcement, setAnnouncement] = useState({});
    const [files, setFiles] = useState([]);
    const [attTitle, setAttTitle] = useState(constants.string_empty);

    const getAnnouncement = async () => {        
        await axios.get(constants.api_get_latest_announcement)
            .then(res => {                
                setAnnouncement(res.data.result);
                if (files.length === 0) {
                    if (res.data.result.files != null
                        && res.data.result.files !== undefined
                        && (res.data.result.files.length > 0)){
                        for (const file of res.data.result.files)
                            files.push(file);
                    }                    

                    if (files.length > 0) {
                        setAttTitle("Xin xem thêm file đính kèm bên dưới:"); 
                    }
                    else{
                        setAttTitle(constants.string_empty);
                    }
                }
            })
            .catch(error => {
                console.log("Error: ", error);
            });
    }

    function clickAttachmentFile(fileId){ 
        const request = {
            id: fileId
        };

        axios.post(constants.api_get_file_content_pdf, request)
            .then(res => {               
                let pdfData = utils.base64ToArrayBuffer(res?.data.result.fileContent);
                let blobData = new Blob([pdfData], { type: 'application/pdf' });
                const fileURL = URL.createObjectURL(blobData);
                window.open(fileURL, "_blank");
            })
            .catch(error => {
                console.log("Error: ", error);
            });

    }
        
    useEffect(() => { getAnnouncement();}, []);

    return (
    <main className="main hero section dark-background">
      <div className="container-fluid">
        <div className="row gy-4">
          <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">
            <h5>{announcement.subject}</h5>	
            <div>{announcement.content}</div>
            <div>{announcement.contentEx01}</div>
            <div>{attTitle}</div>
            <div>
                <ul>
                    {files.map(item => (
                        <li key={item.id}>
                            <Link  onClick={() => clickAttachmentFile(item.id)}>{item.name}</Link>
                        </li>
                    ))}
                </ul>
            </div>
          </div>
        </div>
      </div>
    </main>
    )
  }