import React, { useCallback, useEffect, useRef, useState } from 'react';
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
    
    const defaultSort =  "u.id";
    const lNameSort =  "ue.l_name";
    const [pageIndex, setPageIndex] = useState(1); 
    const [pageTotal, setPageTotal] = useState(0);
    const [dataList, setDataList] = useState([]);
    const findText = useRef("");
    const isFirstTime = useRef(true);
    const sort = useRef(defaultSort);
    const sortType = useRef(constants.sort_type_desc);

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
            console.log("P1 Have param");
            if (parseInt(pageIndexParam) > parseInt(pageTotal))
                pageIndexParam = parseInt(pageTotal);
            pageIndexParamValue = parseInt(pageIndexParam);
            doSearchByPage(pageIndexParamValue); 
                      
        }
        else{
            console.log("P2 No param");
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
        console.log(findText.current, sort.current, sortType.current, pageIndex); 
        let info = userServices.getList(findText.current, sort.current, sortType.current, pageValue); 
        info.then((result) => {
            console.log(result);
            setPageTotal(result.pageTotal);
            dataList.splice(0,dataList.length);
            for (let dataItem of result.dataList) {
                dataList.push(dataItem);// code block to be executed
            }
            console.log(dataList);
        });
    }
    
    function doSearch() {        
        doSearchByPage(pageIndex);
    }

    function onClickSearch(){
        let url = constants.page_admin_users + "?page=1"; 
        setPageIndex(0);
        setFindText();
        console.log('click search');
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
                                        <th>STT</th>
                                        <th onClick={() => doSort("ue.f_name")}>Họ và tên lót</th>
                                        <th onClick={() => doSort("ue.l_name")}>Tên</th>
                                        <th onClick={() => doSort("ue.phone01")}>Số ĐT</th>
                                        <th onClick={() => doSort("ue.email")}>Email</th>
                                        <th>Pw Reset</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>John</td>
                                        <td>Doe</td>
                                        <td>0902.111.111</td>
                                        <td>john@example.com</td>
                                        <td>ABCXYZ</td>
                                        <td>
                                            <button style={actionsStyles} type="button" className="btn btn-primary">
                                                Sửa
                                            </button>
                                            <button type="button" className="btn btn-danger">
                                                Xóa
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Mary</td>
                                        <td>Moe</td>
                                        <td>0902.111.111</td>
                                        <td>mary@example.com</td>
                                        <td></td>
                                        <td>
                                            <button style={actionsStyles} type="button" className="btn btn-primary">
                                                Sửa
                                            </button>
                                            <button type="button" className="btn btn-danger">
                                                Xóa
                                            </button>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>3</td>
                                        <td>Robert</td>
                                        <td>Kenedy</td>
                                        <td>0902.111.111</td>
                                        <td>robertkenedy@example.com</td>
                                        <td></td>
                                        <td>
                                            <button style={actionsStyles} type="button" className="btn btn-primary">
                                                Sửa
                                            </button>
                                            <button type="button" className="btn btn-danger">
                                                Xóa
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(value) => onPageItemClick(value)} /> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
    )
  };