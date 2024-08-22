import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import { pdfjs } from "react-pdf";
import { Link } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

pdfjs.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.6.172/pdf.worker.min.js';

export default function AnnouncementComponent() {  
    const [announcement, setAnnouncement] = useState({});
    const [files, setFiles] = useState([]);
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

                /*
                var len = pdfdata.length;
                var bytes = new Uint8Array(len);
                for (var i = 0; i < len; i++){
                    bytes[i] = pdfdata.charCodeAt(i);                    
                }
                renderPdf = bytes.buffer;
                const pdfFile = new Blob([renderPdf], { type: 'application/pdf' });
                const fileURL = URL.createObjectURL(pdfFile);
                window.open(fileURL, "_blank");
                const url = window.URL.createObjectURL(pdfFile);
                */

        // Create a temporary <a> element to trigger the download
        /*
        const tempLink = document.createElement("a");
        tempLink.href = url;
        tempLink.setAttribute(
          "download",
          `bill.pdf`
        ); // Set the desired filename for the downloaded file

        // Append the <a> element to the body and click it to trigger the download
        document.body.appendChild(tempLink);
        tempLink.click();

        // Clean up the temporary elements and URL
        document.body.removeChild(tempLink);
        window.URL.revokeObjectURL(url);
        */
                /*               
                var len = pdfdata.length;
                var bytes = new Uint8Array(len);
                for (var i = 0; i < len; i++){
                    bytes[i] = pdfdata.charCodeAt(i);                    
                }
                renderPdf = bytes.buffer;
                console.log(renderPdf);
                setFileContent(renderPdf);   
                console.log(fileContent);  
                */           
                //setShowModal(true);
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
                
                </div>
            </Modal.Body>
        </Modal>
    </main>
    )
  }