import React, { useCallback, useEffect, useRef, useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import '../assets/css/page.css';
import * as constants from '../jscode/constants';
import * as utils from "../jscode/utilities";
import { announcementModel } from '../models/announcementModel';
import * as newsServices from '../services/newsServices';
import { MessageComponent } from './MessageComponent';
import PagingComponent from './PagingComponent';

export function AdminMgmtMessagesComponent(props){ 
    
    const actionsStyles = {
        marginRight: "5px",
    };

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

    const addNewStyles = {
        marginBottom: "20px",

    }

    const searchStyles = {
        marginBottom: "20px",
    };

    const searchTextStyles = {
        width: "100%",
        height: "2.3rem",
        left: "0px",
        position: "relative",
        borderRadius: "5px",
        backgroundColor: "#ccffee",
    };   

    const textModal = {
        color: "white",
    }  

    const defaultSort =  "id";
    const [pageIndex, setPageIndex] = useState(1); 
    const [pageTotal, setPageTotal] = useState(0);
    const [dataList, setDataList] = useState([]);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [showEditModal, setShowEditModal] = useState(false);
    const findText = useRef("");
    const isFirstTime = useRef(true);
    const sort = useRef(defaultSort);
    const sortType = useRef(constants.sort_type_desc);
    const curItem = useRef({});

    const [title, setTitle] = useState(constants.string_empty); 
    const [content, setContent] = useState(constants.string_empty); 
    const [contentEx01, setContentEx01] = useState(constants.string_empty);
    const [files, setFiles] = useState(null);
    const [fileList, setFileList] = useState([]);

    const [message, setMessage] = useState(constants.string_empty);
    const [success, setSuccess] = useState(true);
    const [showModal, setShowModal] = useState(false);

    const curId = useRef(0);

    const navigate = useNavigate();
    const location = useLocation();

    const onPageItemClick = useCallback((itemValue) => {
        itemValue = parseInt(itemValue);
        setPageIndex(itemValue);
        let url = constants.page_admin_messages + "?page=" + itemValue;
        navigate(url);
    }, [pageIndex]);    
    
    useEffect(() => { pageInitValues();}, [pageIndex, findText]);

    function pageInitValues() {
        if (pageIndex < 1)
            setPageIndex(1);         
        let pageIndexParamValue = 1;
        const queryParams = new URLSearchParams(location.search);        
        let pageIndexParam = queryParams.get('page');
        if (pageIndexParam != null 
            && pageIndexParam !== undefined 
            && pageIndex > 0) {
            pageIndexParamValue = parseInt(pageIndexParam); 
            setPageIndex(pageIndexParamValue);   
            doSearchByPage(pageIndexParamValue);                               
        }
        else{
            if (pageIndex > 0){ 
                sort.current = defaultSort;
                sortType.current = constants.sort_type_desc;
                if ((isFirstTime.current) && (findText.current === "")){
                    doSearch();
                    isFirstTime.current = false;
                }                
            }
        }
    }

    function setFindText(){
        let searchValue = document.getElementById('txtSearch').value;
        searchValue = searchValue.trim();

        if (!utils.isNullOrEmptyOrSpace(searchValue) 
            && utils.isNullOrEmptyOrSpace(findText.current)){
                findText.current = searchValue;
        }
    }

    function doSearchByPage(pageValue) {        
        setFindText();
        if (!utils.isNullOrEmptyOrSpace(findText.current) && sort.current === defaultSort){
            sort.current = defaultSort;
            sortType.current = constants.sort_type_asc;
        }        
        let info = newsServices.getList(findText.current, sort.current, sortType.current, pageValue); 
        info.then((result) => {
            setPageTotal(result.pageTotal);
            setDataList([]);
            for (let dataItem of result.dataList) {
                setDataList(prevState => [...prevState, dataItem]);
            }
        });
    }
    
    function doSearch() {        
        doSearchByPage(pageIndex);
    }

    function onClickSearch(){
        let url = constants.page_admin_messages + "?page=1"; 
        setPageIndex(0);
        setFindText();
        navigate(url);
    }
    
    function doSort(column){
        if (column !== sort.current){
            sort.current = column;
            sortType.current = constants.sort_type_asc;
        }
        else{
            sortType.current = (sortType.current === constants.sort_type_asc)
                ? constants.sort_type_desc
                : constants.sort_type_asc;
        }
        doSearch();
    }

    function doEdit(id){
        let editItem = newsServices.getById(id);
        editItem.then((result) => {
            setMessage(constants.string_empty);
            setSuccess(true);
            curItem.current = result;
            setTitle(result.subject);
            setContent(result.content);
            setContentEx01(result.contentEx01);
            setFileList([]);
            
            if (result.files.length > 0) {
                for (let file of result.files) {
                    setFileList(prevState => [...prevState, file]);
                }
            }
            setShowModal(true);
        });    
    }

    function doDelete(id){
        curId.current = id;
        curItem.current = newsServices.findItemInList(dataList, id);
        if (curItem.current != null){
            setTitle(curItem.current.subject);
            setContent(curItem.current.content);
            setContentEx01(curItem.current.contentEx01);
            setShowDeleteModal(true);
        } 
        
    }    

    function doShow(id){
        curId.current = id;        
        let saveRes = newsServices.setShow(id);
            saveRes.then((result) => {
                setMessage(constants.string_empty);
                setSuccess(true);
                doSearch();
            });
    }

    function handleChangeText(value){
        findText.current = value;
    }

    function handleCloseDeleteModal(){
        setShowDeleteModal(false);
    }

    function handleCloseEditModal(){
        setShowEditModal(false);
    }

    const deleteItem = async() => {        
        await newsServices.setDelete(curId.current, true).then((result) => {
            handleCloseDeleteModal();
            doSearch();
        });        
    }

    function editItem(){
        newsServices.update(curItem.current);
        handleCloseEditModal();
    }

    const setCurrentSubject = (text) => {
        curItem.current.subject = text;
    }

    const setCurrentContent = (text) => {
        curItem.current.content = text;
    }

    const setCurrentContentEx01 = (text) => {
        curItem.current.contentEx01 = text;
    }

    function handleFile(event) {
        let files = event.target.files;
        setFiles(files); 
    }

    function openModel(event) {
        setMessage(constants.string_empty);
        curItem.current = new announcementModel();
        setShowModal(true);
    }

    function closeModal(event){
        setShowModal(false);
    }

    function saveItem(event) {
        setSuccess(true);
        setMessage(constants.string_empty);
        if (curItem.current.id === 0) {
            let saveRes = newsServices.createNew(files, title, content, contentEx01);
            saveRes.then((result) => {
                setMessage(result.message);
                setSuccess(result.execResult);
                doSearch();
            });
        }
        else{
            let saveRes = newsServices.update(curItem.current.id, files, title, content, contentEx01);
            saveRes.then((result) => {
                setMessage(result.message);
                setSuccess(result.execResult);
                doSearch();
            });
        }
    }     
    

    const clickAttachmentFile = async (fileId) => {
        await newsServices.getFileContent(fileId)
        .then((content) => {
            let blobData = new Blob([content], { type: 'application/pdf' });
            const fileURL = URL.createObjectURL(blobData);
            window.open(fileURL, "_blank");
        });
    }

    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">                    
                    <div className="col-lg-12 order-2 order-lg-1 flex-column justify-content-top">
                        <h5 style={addNewPopupTitle}>{props.text}</h5>
                        <div style={addNewStyles}>
                            <Button className='btn' onClick={() => openModel()}>
                                Thêm mới
                            </Button>
                        </div>

                        <div style={searchStyles} className='row'>
                            <div className='col-md-4'>
                                <input type="text" id="txtSearch" placeholder="Search..." name="search" className="form-control border-0" style={searchTextStyles} onChange={(e) => handleChangeText(e.target.value)}  />
                            </div>
                            <div className='col-md-3'>
                                <button type="button" className="btn btn-primary" onClick={onClickSearch} >
                                    Tìm kiếm
                                </button>
                            </div>
                        </div>
                        
                        <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(value) => onPageItemClick(value)} /> 

                        <table className="table">
                            <thead>
                                <tr>
                                    <th onClick={() => doSort("id")}>#</th>
                                    <th onClick={() => doSort("subject")}>Tựa đề</th>
                                    <th onClick={() => doSort("content")}>Nội dung</th>
                                    <th>Hiển thị</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            { 
                                dataList.map(dataItem => 
                                <tr key={dataItem.id}>
                                    <td>{dataItem.orderNo}</td>
                                    <td>{dataItem.subject}</td>
                                    <td>{dataItem.contentMini}</td>
                                    <td>{dataItem.showText}</td>
                                    <td>
                                        <button style={actionsStyles} type="button" className="btn btn-primary" onClick={(id) => doEdit(dataItem.id)}>
                                            Sửa
                                        </button>
                                        <button style={actionsStyles} type="button" className="btn btn-danger" onClick={(id) => doDelete(dataItem.id)}>
                                            Xóa
                                        </button>
                                        <button style={actionsStyles} type="button" className="btn btn-primary" onClick={(id) => doShow(dataItem.id)}>
                                            Hiển thị
                                        </button>
                                    </td>
                                </tr>)
                            }
                            </tbody>
                        </table>
                        <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(value) => onPageItemClick(value)} />

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
                                            <input style={addNewPopupTitleText} type="text" onChange={(e) => setTitle(e.target.value)} defaultValue={title} />                                    
                                        </div>
                                    </div>

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Nội dung:
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <textarea rows={5} style={addNewPopupTitleText} type="text" onChange={(e) => setContent(e.target.value)} defaultValue={content}  />                                    
                                        </div>
                                    </div>

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            Nội dung mở rộng 1:
                                        </div>
                                        <div className="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                                            <textarea rows={5} style={addNewPopupTitleText} type="text" onChange={(e) => setContentEx01(e.target.value)} defaultValue={contentEx01}  />                                    
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

                                    <div style={rowStyles} className="row ">
                                        <div className="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <ul>
												{
													fileList.map((item) => (
														(item.disabled)
														? (
															<li key={item.id}>
																<Link  onClick={() => clickAttachmentFile(item.id)}>{item.name}<span> - (DISABLED)</span></Link>
															</li>
														)
														: (
															<li key={item.id}>
																<Link  onClick={() => clickAttachmentFile(item.id)}>{item.name}</Link> 
															</li>
														)                        
													)
												)}
											</ul>                                            
                                        </div>
                                    </div>

                                    <div className="row ">
                                        <div style={addNewPopupButton} className="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <button style={popupButton} className="btn btn-primary" onClick={(e) => saveItem(e)}>
                                                Lưu thông báo
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

                        <Modal show={showDeleteModal} onHide={handleCloseDeleteModal}>
                            <Modal.Header closeButton>
                            <Modal.Title style={textModal}>Xóa thông báo</Modal.Title>
                            </Modal.Header>
                            <Modal.Body style={textModal}>Bạn có chắc chắn xóa thông báo này không?
                            <div>{title}</div>
                            </Modal.Body>
                            <Modal.Footer>
                            <Button variant="secondary" onClick={handleCloseDeleteModal}>
                                Đóng
                            </Button>
                            <Button variant="primary" className="btn btn-danger" onClick={deleteItem}>
                                Xóa
                            </Button>
                            </Modal.Footer>
                        </Modal>                        
                    </div>
                </div>
            </div>
        </main>
    )
  };