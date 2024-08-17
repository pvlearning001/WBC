import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';

function PagingListComponent(props) {
    const handleItemClick = useCallback((value) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(value);      }
        }, []);
    
    let result = [];
    for (let number = 1; number <= props.pageTotal; number++) { 
        if (number === props.pageIndex){
            result.push(<Pagination.Item key={number} active onClick={() => handleItemClick(number)}>{number}</Pagination.Item>);
        }
        else{
            result.push(<Pagination.Item key={number} onClick={() => handleItemClick(number)}>{number}</Pagination.Item>);
        }
    }

    return result
}  
export default memo(PagingListComponent);