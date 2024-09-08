import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import * as newsServices from '../services/newsServices';

export default function AnnouncementComponent() {  
    const [announcement, setAnnouncement] = useState({});
    const [files, setFiles] = useState([]);
    const [attTitle, setAttTitle] = useState(constants.string_empty);

    const getAnnouncement = async () => {
        await newsServices.getLatestAnnouncement()
        .then((result) => {
            setAnnouncement(result);            
            if (result.files.length > 0) {
                setAttTitle("Xin xem thêm file đính kèm bên dưới:"); 
                setFiles([]);
                for (let file of result.files) {
                    setFiles(prevState => [...prevState, file]);
                }
            }
            else{
                setAttTitle(constants.string_empty);
            }
        });
    }

    const clickAttachmentFile = async (fileId) => {
        await newsServices.getFileContent(fileId)
        .then((content) => {
            let blobData = new Blob([content], { type: 'application/pdf' });
            const fileURL = URL.createObjectURL(blobData);
            window.open(fileURL, "_blank");
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