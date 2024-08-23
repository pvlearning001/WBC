import React, { useCallback, useEffect, useState } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";
import PagingComponent from './PagingComponent';


export default function AdminMngtUserComponent(props){
    const pageTotalExample = 5;
    const [pageIndex, setPageIndex] = useState(1); 
    const [pageTotal, setPageTotal] = useState(pageTotalExample);

    const navigate = useNavigate();
    const location = useLocation();  
    
    const actionsStyles = {
        "margin-right": "5px",
    };

    const searchStyles = {
        "margin-bottom": "20px",
    };

    const headerStyles = {
        "margin-bottom": "30px",
        "text-align": "center",
    };

    const searchTextStyles = {
        "width": "100%",
        "height": "2.3rem",
        "left": "0px",
        "position": "relative",
        "border-radius": "5px",
        "background-color": "#ccffee",
    };

    function pageInitValues() {
        const queryParams = new URLSearchParams(location.search);
        let pageIndexParam = queryParams.get('page'); 
        if (pageIndexParam != null 
            && pageIndexParam !== undefined) {
            if (parseInt(pageIndexParam) > parseInt(pageTotal))
                pageIndexParam = parseInt(pageTotal);
            setPageIndex(pageIndexParam);
            setPageTotal(pageTotalExample)
        }
    }

    useEffect(() => { pageInitValues();});

    const onPageItemClick = useCallback((itemValue) => {
        setPageIndex(itemValue);        
        setPageTotal(pageTotalExample);
        let url = constants.page_admin_users + "?page=" + itemValue;
        navigate(url);

    }, [pageIndex]);

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
                                    <input type="text" placeholder="Search..." name="search" className="form-control border-0" style={searchTextStyles} />
                                </div>
                                <div className='col-md-3'>
                                    <button type="button" className="btn btn-primary">
                                        Tìm kiếm
                                    </button>
                                </div>
                            </div>
                            <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(itemValue) => onPageItemClick(itemValue)} />           
                            <table className="table">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Họ và tên lót</th>
                                        <th>Tên</th>
                                        <th>Số ĐT</th>
                                        <th>Email</th>
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
                            <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(itemValue) => onPageItemClick(itemValue)} />
                        </div>
                    </div>
                </div>
            </div>
        </main>
    )
  };