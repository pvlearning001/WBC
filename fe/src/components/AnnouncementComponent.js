import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import { Link } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";

export default function AnnouncementComponent() {  
    const [announcement, setAnnouncement] = useState({});
    const [files, setFiles] = useState([]);
    const [doc, setDoc] = useState(constants.string_empty);
    const [showModal, setShowModal] = useState(false);
    const [attTitle, setAttTitle] = useState(constants.string_empty);

    const getAnnouncement = async () => {        
        await axios.get(constants.api_get_latest_announcement)
            .then(res => {                
                setAnnouncement(res.data.result);
                if (files.length === 0) {
                    for (const file of res.data.result.files)
                        files.push(file);

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

    async function clickAttachmentFile(fileId){ 
        const request = {
            id: fileId
        };

        await axios.post(constants.api_get_file_content_pdf, request)
            .then(res => {                
                console.log(res.data.result);
                let binary = res.data.result.fileContent;
                if (binary != null) {
                    let contentType = "application/pdf";
                    let pdfFile = "data:" + contentType + ";base64," + binary;
                    setDoc(pdfFile);                    
                }
                else{
                    setDoc(constants.string_empty);
                }
                setShowModal(true);
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


      <Modal
            show={showModal}
            fullscreen={true}
            onHide={() => setShowModal(false)}
            dialogClassName="modal-90w main hero section  dark-background"
            aria-labelledby="example-custom-modal-styling-title"
        >
            <Modal.Header closeButton>
            <Modal.Title id="example-custom-modal-styling-title">
                Noi dung thong bao
            </Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="container col-xxl-12 col-xl-12 col-lg-112 col-md-12 col-sm-12 col-12">

                    <embed
                        src={doc}
                        id="displayFile"
                        alt="your image"
                        width="100%"
                        height="600px"
                        style={{ borderStyle: "solid" }}
                        type="application/pdf"
                    />
                

                </div>
            </Modal.Body>
        </Modal>
    </main>
    )
  }