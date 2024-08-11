import React, { useCallback, useState } from 'react';
import PagingComponent from "./PagingComponent";

export default function AdminMngtUserComponent(props){
    const [curPage, setCurPage] = useState(0); 
    const paginationClicked = useCallback((e) => {
        setCurPage(e);
        console.log(e);        
    }, [curPage]);
    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">
                    <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">
                        <h5>{props.text}</h5>
                        <PagingComponent paginationClicked={paginationClicked} />
                    </div>
                </div>
            </div>
        </main>
    )
  };