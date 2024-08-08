import React from "react";


export function TempComponent(props){
    return(
        <main className="main hero section dark-background">
            <div className="container-fluid">
                <div className="row gy-4">
                    <div className="col-lg-12 order-2 order-lg-1 d-flex flex-column justify-content-top">
                        <h5>{props.text}</h5>
                    </div>
                </div>
            </div>
        </main>
    )
  };