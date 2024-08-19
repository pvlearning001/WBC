import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';

function PagingPostfixComponent(props) {
    let nextValue = parseInt(props.pageIndex) + 1;
    let totalValue = parseInt(props.pageTotal);
    const handleItemClick = useCallback((value) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(value);      
            }
        }, []);

    let result=[];
    if (props.pageTotal > 1){
        if (props.pageIndex < props.pageTotal){
            result.push(<Pagination.Next key="next" onClick={() => handleItemClick(nextValue)} />)
            result.push(<Pagination.Last key="last" onClick={() => handleItemClick(totalValue)} />)
        }
        else{
            result.push(<Pagination.Next key="next" disabled />)
            result.push(<Pagination.Last key="last" disabled />)
        }
    }
    
    return result
}  
export default memo(PagingPostfixComponent);