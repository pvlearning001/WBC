import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';
import * as utils from "../jscode/utilities";

function PagingListComponent(props) {
    const handleItemClick = useCallback((value) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(value);      }
        }, []);
    
    let result = [];
    if (props.pageTotal > 1){
        let pageSession = utils.buildPageSession(props.pageIndex, props.pageTotal); 
        for (let page of pageSession) {
            if (page == props.pageIndex){
                result.push(<Pagination.Item key={page} active>{page}</Pagination.Item>);
            }
            else{
                result.push(<Pagination.Item key={page} onClick={() => handleItemClick(page)}>{page}</Pagination.Item>);
            }
        }
        
    }

    return result
}  
export default memo(PagingListComponent);