import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';

function PagingPostfixComponent(props) {
    let nextValue = props.pageIndex + 1;
    let totalValue = props.pageTotal;
    const handleItemClick = useCallback((value) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(value);      
            }
        }, []);

    let result=[];
    result.push(<Pagination.Next key="next" onClick={() => handleItemClick(nextValue)} />)
    result.push(<Pagination.Last key="last" onClick={() => handleItemClick(totalValue)} />)
    return result
}  
export default memo(PagingPostfixComponent);