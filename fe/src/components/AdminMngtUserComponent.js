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
                        <h5>{props.text}</h5>
                        <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(itemValue) => onPageItemClick(itemValue)} />
                        <div>ABC</div>
                        <PagingComponent pageIndex={pageIndex} pageTotal={pageTotal} pageItemClick={(itemValue) => onPageItemClick(itemValue)} />

                    </div>
                </div>
            </div>
        </main>
    )
  };