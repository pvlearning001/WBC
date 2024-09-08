import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import '../assets/css/page.css';
import * as constants from '../jscode/constants';
import * as newsServices from '../services/newsServices';
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

    const [title, setTitle] = useState(constants.string_empty); 
    const [content, setContent] = useState(constants.string_empty); 
    const [contentEx01, setContentEx01] = useState(constants.string_empty); 

    const [files, setFiles] = useState(null);

    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(true);
    const [showModal, setShowModal] = useState(false);

    function handleFile(event) {
        let files = event.target.files;
        setFiles(files); 
    }

    function openModel(event) {
        setMessage(constants.string_empty);
        /*
        let list = newsServices.getList(null, null, null, 1);        
        list.then((result) => {
            console.log(result);
        });
        */
        let latest = newsServices.getLatestAnnouncement();
        setShowModal(true);
    }

    function closeModal(event){
        setShowModal(false);
    }

    function createAnnouncement(event) {
        setSuccess(true);
        setMessage(constants.string_empty);
        let saveRes = newsServices.createNew(files, constants.cateid_announcement, title, content, contentEx01);
        saveRes.then((result) => {
            console.log(result);
            setMessage(result.message);
            setSuccess(result.execResult);
        });
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
                                            <button style={popupButton} className="btn btn-primary" onClick={(e) => createAnnouncement(e)}>
                                                Thêm mới thông báo
                                            </button> 
                                            <button style={popupButton} className="btn btn-primary" onClick={(e) => closeModal(e)}>
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