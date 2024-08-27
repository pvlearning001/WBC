import axios from 'axios';
import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import '../assets/css/page.css';
import * as constants from '../jscode/constants';
import { MessageComponent } from './MessageComponent';


export function AdminMgmtMessagesComponent(props){
    const rowStyles = {
        margin: "10px",
    }

    const addNewPopupTitle = {
        textAlign: "center",
    }

    const addNewPopupButton = {
        textAlign: "center",
    }

    const popupButton = {
        margin: "10px",
    }

    const addNewPopupTitleText = {
        width: "300%",
    }

    const textModal = {
        color: "white",
    }

    const [title, setTitle] = useState(constants.string_empty); 
    const [content, setContent] = useState(constants.string_empty); 
    const [contentEx01, setContentEx01] = useState(constants.string_empty); 

    const [files, setFiles] = useState(null); 
    const token = localStorage.getItem(constants.token_string);

    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(true);
    const [showModal, setShowModal] = useState(false);

    function handleFile(event) {
        let files = event.target.files;
        setFiles(files); 
    }

    function openModel(event) {
        setMessage(constants.string_empty)
        setShowModal(true);
    }

    function handleCloseModal(event){
        setShowModal(false);
    }

    function handleFileUpload(event) {
        setSuccess(true);
        setMessage(constants.string_empty);
        // get the selected file from the input
        const filesUpload = files;
        // create a new FormData object and append the file to it
        const formData = new FormData();
        formData.append('cateId', 1);
        formData.append('subject', title);
        formData.append('content', content);
        formData.append('contentEx01', contentEx01);
        if (filesUpload != null && filesUpload.length > 0) {
            for (const file of filesUpload)
                formData.append('files', file);
        }
        
        //formData.append("files", filesUpload);
        // make a POST request to the File Upload API with the FormData object and Rapid API headers
        axios({ 
            // Endpoint to send files 
            url: "/news/create", 
            method: "POST", 
            headers: {   
                "Authorization" : `Bearer ${token}`,             
                "Content-Type": "multipart/form-data"
            }, 
            // Attaching the form data 
            data: formData, 
          }) 
            .then((res) => {
                if (res.data.code === constants.api_code_success){
                    setMessage('Them moi thanh cong');
                    setSuccess(true);
                }
            }) // Handle the response from backend here 
            .catch((err) => {
                setMessage(err);
                setSuccess(false);
            }); // Catch errors if any
        }   

    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">                    
                    <div className="col-lg-12 order-2 order-lg-1 flex-column justify-content-top">
                        <h5 style={addNewPopupTitle}>{props.text}</h5>

                        <Button className='btn' onClick={() => openModel()}>
                            Thêm mới
                        </Button>

                        <Modal
                            show={showModal}
                            fullscreen={true}
                            onHide={() => setShowModal(false)}
                            dialogClassName="modal-90w main hero section  dark-background"
                            aria-labelledby="example-custom-modal-styling-title"
                        >
                            <Modal.Header closeButton>
                            <Modal.Title id="example-custom-modal-styling-title">
                                Thêm mới thông báo
                            </Modal.Title>
                            </Modal.Header>
                            <Modal.Body>
                                <div className="container col-xxl-8 col-xl-8 col-lg-10 col-md-10 col-sm-12 col-12">

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Tiêu đề:
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <input style={addNewPopupTitleText} type="text" onChange={(e) => setTitle(e.target.value)}  />                                    
                                        </div>
                                    </div>

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Nội dung:
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <textarea rows={5} style={addNewPopupTitleText} type="text" onChange={(e) => setContent(e.target.value)}  />                                    
                                        </div>
                                    </div>

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Nội dung mở rộng 1:
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <textarea rows={5} style={addNewPopupTitleText} type="text" onChange={(e) => setContentEx01(e.target.value)}  />                                    
                                        </div>
                                    </div>


                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Files đính kèm (pdf)
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <input multiple="multiple" type="file" onChange={(e) => handleFile(e)}  />                                    
                                        </div>
                                    </div>

                                    <div className="row ">
                                        <div style={addNewPopupButton} className="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <button style={popupButton} className="btn btn-primary" onClick={(e) => handleFileUpload(e)}>
                                                Thêm mới thông báo
                                            </button> 
                                            <button style={popupButton} className="btn btn-primary" onClick={(e) => handleCloseModal(e)}>
                                                Đóng
                                            </button> 
                                        </div>
                                    </div>                                    

                                    <div className="row ">
                                        <div style={addNewPopupButton} className="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <MessageComponent show={true} message={message} success={success} />
                                        </div>
                                    </div>

                                </div>
                            </Modal.Body>
                        </Modal>                       
                    </div>
                </div>
            </div>
        </main>
    )
  };