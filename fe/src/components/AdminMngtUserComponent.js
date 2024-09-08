import React, { useCallback, useEffect, useRef, useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { useLocation, useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";
import * as userServices from "../services/userServices";
import PagingComponent from './PagingComponent';


export default function AdminMngtUserComponent(props){  
    
    const actionsStyles = {
        marginRight: "5px",
    };

    const searchStyles = {
        marginBottom: "20px",
    };

    const headerStyles = {
        marginBottom: "30px",
        textAlign: "center",
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

    const resetPwStyles = {
        marginBottom: "20px"
    };

    const checkboxStyles = {
        marginLeft: "20px",
    };
    
    const defaultSort =  "u.id";
    const lNameSort =  "ue.l_name";
    const [pageIndex, setPageIndex] = useState(1); 
    const [pageTotal, setPageTotal] = useState(0);
    const [dataList, setDataList] = useState([]);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [showEditModal, setShowEditModal] = useState(false);
    const [showConfirmResetPwModal, setShowConfirmResetPwModal] = useState(false);
    const [pwReset, setPwReset] = useState("");
    const findText = useRef("");
    const isFirstTime = useRef(true);
    const sort = useRef(defaultSort);
    const sortType = useRef(constants.sort_type_desc);
    const curUser = useRef({});

    const curId = useRef(0);

    const navigate = useNavigate();
    const location = useLocation();

    const onPageItemClick = useCallback((itemValue) => {
        itemValue = parseInt(itemValue);
        setPageIndex(itemValue);
        let url = constants.page_admin_users + "?page=" + itemValue;
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
            sort.current = lNameSort;
            sortType.current = constants.sort_type_asc;
        }        
        let info = userServices.getList(findText.current, sort.current, sortType.current, pageValue); 
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
        let url = constants.page_admin_users + "?page=1"; 
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

    function handleChangeText(value){
        findText.current = value;
    }

    function doEdit(id){
        curUser.current = userServices.findItemInList(dataList, id);
        if (curUser.current != null){
            setPwReset(curUser.current.pwReset);
            setShowEditModal(true);
        }            
    }

    function doDelete(id){
        curId.current = id;
        setShowDeleteModal(true);
    }

    function doResetPw(){
        setShowConfirmResetPwModal(true);
    }

    function handleCloseDeleteModal(){
        setShowDeleteModal(false);
    }

    function handleCloseConfirmResetPwModal(){
        setShowConfirmResetPwModal(false);
    }

    function handleCloseEditModal(){
        setShowEditModal(false);
    }

    const deleteUser = async() => {        
        await userServices.setDelete(curId.current, true).then((result) => {
            handleCloseDeleteModal();
            doSearch();
        });        
    }

    function editUser(){
        userServices.update(curUser.current);
        handleCloseEditModal();
    }

    function resetPw(){
        let userId = curUser.current.id;
        let info = userServices.resetPwAdmin(userId);        
        info.then((result) => {
            if (!utils.isNullOrEmpty(result.pwReset)){
                setPwReset(result.pwReset);
                curUser.current.pwReset = result.pwReset;
                curUser.current.isResetPw = true;
            }
        });
        handleCloseConfirmResetPwModal();
    }

    const parseName = (text) => {
        const nameArr = utils.getDetailsName(text);		
        curUser.current.fName = nameArr[0];
        curUser.current.mName = nameArr[1];
        curUser.current.lName = nameArr[2];
        curUser.current.fmName = utils.buildFMName(curUser.current.fName, curUser.current.mName);
        curUser.current.fullName = utils.buildFullName(curUser.current.fName, curUser.current.mName, curUser.current.lName);
    }

    const setUserEmail = (text) => {
        curUser.current.email = text;
    }

    const setUserPhone = (text) => {
        curUser.current.phone = text;
    }

    const setUserName = (text) => {
        curUser.current.uName = text;
    }

    const isAdmin = () => {        
        if (curUser.current.roles_id != null
            && curUser.current.roles_id !== undefined){
            let rolesId = curUser.current.roles_id.toString();
            let result = rolesId.includes(constants.role_id_admin.toString());
            return result;
        }        
        return false;
    }

    const handleAdminChange = (event) => {
        if (event.target.checked)
            curUser.current.roles_id = constants.role_id_list_admin;
        else
            curUser.current.roles_id = constants.role_id_list_user;
    }

    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">
                    <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">                        
                        
                        <div className="container mt3">
                            <div style={headerStyles} className='row'>
                            <h3>Danh sách User</h3>
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
                                        <th onClick={() => doSort(defaultSort)}>#</th>
                                        <th onClick={() => doSort("ue.f_name")}>Họ và tên lót</th>
                                        <th onClick={() => doSort("ue.l_name")}>Tên</th>
                                        <th onClick={() => doSort("u.user_name")}>User name</th>
                                        <th onClick={() => doSort("ue.phone01")}>Số ĐT</th>
                                        <th onClick={() => doSort("ue.email")}>Email</th>
                                        <th>Pw Reset</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                { 
                                    dataList.map(dataItem => 
                                    <tr key={dataItem.id}>
                                        <td>{dataItem.orderNo}</td>
                                        <td>{dataItem.fmName}</td>
                                        <td>{dataItem.lName}</td>
                                        <td>{dataItem.uName}</td>
                                        <td>{dataItem.phone}</td>
                                        <td>{dataItem.email}</td>
                                        <td>{dataItem.pwReset}</td>
                                        <td>
                                            <button style={actionsStyles} type="button" className="btn btn-primary" onClick={(id) => doEdit(dataItem.id)}>
                                                Sửa
                                            </button>
                                            <button type="button" className="btn btn-danger" onClick={(id) => doDelete(dataItem.id)}>
                                                Xóa
                                            </button>
                                        </td>
                                    </tr>)
                                }
                                </tbody>
                            </table>
                            <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(value) => onPageItemClick(value)} /> 
                        </div>
                    </div>
                </div>
            </div>

            <Modal show={showDeleteModal} onHide={handleCloseDeleteModal}>
                <Modal.Header closeButton>
                <Modal.Title style={textModal}>Xóa User</Modal.Title>
                </Modal.Header>
                <Modal.Body style={textModal}>Bạn có chắc chắn xóa user này không</Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseDeleteModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="btn btn-danger" onClick={deleteUser}>
                    Xóa
                </Button>
                </Modal.Footer>
            </Modal>            

            <Modal show={showConfirmResetPwModal} onHide={handleCloseDeleteModal}>
                <Modal.Header closeButton>
                <Modal.Title style={textModal}>Reset Password</Modal.Title>
                </Modal.Header>
                <Modal.Body style={textModal}>Bạn có chắc chắn muốn reset password của user này không</Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseConfirmResetPwModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="btn btn-danger" onClick={resetPw}>
                    Reset Password
                </Button>
                </Modal.Footer>
            </Modal>

            <Modal show={showEditModal} fullscreen={true} onHide={handleCloseEditModal} dialogClassName="modal-90w main hero section  dark-background"
                            aria-labelledby="example-custom-modal-styling-title">
                <Modal.Header closeButton>
                <Modal.Title style={textModal}>{curUser.current.fullName}</Modal.Title>
                </Modal.Header>
                <Modal.Body style={textModal}>
                    <div className="container">
                        <div className="row">
                            <div className='col-md-3'>
                                Họ và tên:
                            </div>
                            <div className='col-md-9'>
                                <input className="admin-edit-user-form-control border-0" type="text" name="fullName" defaultValue={curUser.current.fullName}  onChange={(e) => parseName(e.target.value)} />
                            </div>
                        </div>
                        <div className="row">
                            <div className='col-md-3'>
                                User name:
                            </div>
                            <div className='col-md-9'>
                                <input className="admin-edit-user-form-control border-0" type="text" name="email" defaultValue={curUser.current.uName}  onChange={(e) => setUserName(e.target.value)} />
                            </div>
                        </div>
                        <div className="row">
                            <div className='col-md-3'>
                                Email:
                            </div>
                            <div className='col-md-9'>
                                <input className="admin-edit-user-form-control border-0" type="text" name="email" defaultValue={curUser.current.email}  onChange={(e) => setUserEmail(e.target.value)} />
                            </div>
                        </div>
                        <div className="row">
                            <div className='col-md-3'>
                                Phone:
                            </div>
                            <div className='col-md-9'>
                                <input className="admin-edit-user-form-control border-0" type="text" name="email" defaultValue={curUser.current.phone}  onChange={(e) => setUserPhone(e.target.value)} />
                            </div>
                        </div>
                        <div className="row">                        
                            <div className='col-md-3'>
                                <div style={resetPwStyles}>
                                    Password Reset:
                                </div>                                
                            </div>
                            <div className='col-md-9'>
                                {pwReset}
                            </div>
                        </div>
                        <div className="row">
                            <div className='col-md-3'>
                                Phân quyền:
                            </div>
                            <div className='col-md-9'>
                                <input type="checkbox" id="chkUser" name="chkUser" value={1} disabled={true} checked/>
                                    Role User
                                <input type="checkbox" id="chkAdmin" name="chkAdmin" value={2} style={checkboxStyles} defaultChecked={isAdmin()} onChange={(event) => handleAdminChange(event)}/>
                                    Role Admin
                            </div>
                        </div>
                    </div>
				</Modal.Body>
                <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseEditModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="btn btn-danger" onClick={editUser}>
                    Sửa
                </Button>
                <Button variant="primary" className="btn btn-danger" onClick={doResetPw}>
                    Reset Password
                </Button>
                </Modal.Footer>
            </Modal>
        </main>
    )
  };