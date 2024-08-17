import React, { useCallback, useState } from 'react';
import PagingTestComponent from './PagingTestComponent';

export default function AdminMngtUserComponent(props){
    const [pageIndex, setPageIndex] = useState(0); 

    const onPageItemClick = useCallback((itemValue) => {
        console.log("User ", itemValue);
    }, []);
    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">
                    <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">
                        <h5>{props.text}</h5>
                        <PagingTestComponent pageItemClick={(itemValue) => onPageItemClick(itemValue)} />
                    </div>
                </div>
            </div>
        </main>
    )
  };