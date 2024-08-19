import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';

function PagingPrefixComponent(props) {

    let prevValue = parseInt(props.pageIndex) - 1;
    const handleItemClick = useCallback((value) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(value);      
            }
        }, []);

    let result=[];

    if (props.pageTotal > 1){
        if (props.pageIndex > 1){
            result.push(<Pagination.First key="first" onClick={() => handleItemClick(1)} />)
            result.push(<Pagination.Prev key="prev" onClick={() => handleItemClick(prevValue)} />)
        }
        else{
            result.push(<Pagination.First key="first" disabled />)
            result.push(<Pagination.Prev key="prev" disabled />)
        }
    }
    
    return result
}  
export default memo(PagingPrefixComponent);