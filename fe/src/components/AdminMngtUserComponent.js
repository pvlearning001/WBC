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

    const pageTotalExample = 5;
    const defaultSort =  "u.id";
    const lNameSort =  "ue.l_name";
    const [pageIndex, setPageIndex] = useState(1); 
    const [pageTotal, setPageTotal] = useState(pageTotalExample);
    const findText = useRef("");
    const sort = useRef(defaultSort);
    const sortType = useRef(constants.sort_type_desc);
    const countInitRedirect = useRef(0);

    const navigate = useNavigate();
    const location = useLocation();

    const onPageItemClick = useCallback((itemValue) => {
        countInitRedirect.current = 0;
        let url = constants.page_admin_users + "?page=" + itemValue;
        navigate(url);
    }, []);

    function pageInitValues() {
        countInitRedirect.current = countInitRedirect.current + 1;
        console.log("pos 1");
        console.log("countInitRedirect", countInitRedirect.current);
        let pageIndexParamValue = 1;
        const queryParams = new URLSearchParams(location.search);        
        let pageIndexParam = queryParams.get('page');        
        if (pageIndexParam != null 
            && pageIndexParam !== undefined) {
            if (parseInt(pageIndexParam) > parseInt(pageTotal))
                pageIndexParam = parseInt(pageTotal);
            pageIndexParamValue = parseInt(pageIndexParam);
            setPageIndex(pageIndexParamValue);
            if (countInitRedirect.current === 2){
                countInitRedirect.current = countInitRedirect.current + 1; 
                doSearch();
            }
        }
        else{
            countInitRedirect.current = countInitRedirect.current + 1;           
            setPageIndex(1);
            findText.current = "";
            sort.current = defaultSort;
            sortType.current = constants.sort_type_desc; 
            
            console.log("pos 2");
            console.log("countInitRedirect pos 2", countInitRedirect.current);
            
            if(countInitRedirect.current === 2){
                setPageIndex(1);
                if (pageIndex === 1){
                    console.log("do search pos 2");
                    doSearch();
                }
                countInitRedirect.current = 0;
            }
            
        }
        //if (pageIndexParamValue === pageIndex && countInitRedirect.current === 2)
        
            
    }
    
    function doSearch() {        
        let searchValue = document.getElementById('txtSearch').value;
        searchValue = searchValue.trim();

        if (!utils.isNullOrEmptyOrSpace(searchValue) 
            && utils.isNullOrEmptyOrSpace(findText.current)){
                findText.current = searchValue;
        }

        if (!utils.isNullOrEmptyOrSpace(findText.current) && sort.current === defaultSort){
            sort.current = lNameSort;
            sortType.current = constants.sort_type_asc;
        }
        console.log(findText.current, sort.current, sortType.current, pageIndex); 
        let info = userServices.getList(findText.current, sort.current, sortType.current, pageIndex); 
        info.then((result) => {
            console.log(result); // "Some User token"
            setPageTotal(result.pageTotal);
        });
    }

    function onClickSearch(){
        countInitRedirect.current = 1;
        let url = constants.page_admin_users + "?page=1";        
        if (pageIndex > 1){
            setPageIndex(1);            
        }
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
    
    
    useEffect(() => { pageInitValues();});
    //useEffect(() => { doSearch();}, [pageIndex]);
    //useEffect(() => { doSort();});    

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
                                        <th onClick={() => doSort("ue.phone")}>Số ĐT</th>
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