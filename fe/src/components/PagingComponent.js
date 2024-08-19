import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';
import PagingListComponent from "./PagingListComponent";
import PagingPostfixComponent from "./PagingPostfixComponent";
import PagingPrefixComponent from "./PagingPrefixComponent";

function PagingComponent(props) {

  const handleItemClick = useCallback((value) => {    
    if (props.pageItemClick != null && props.pageItemClick !== undefined){
        props.pageItemClick(value);      
    }
  }, []);


  return (
     <Pagination>
        <PagingPrefixComponent pageIndex={props.pageIndex} pageTotal={props.pageTotal} pageItemClick={(value) => handleItemClick(value)} />
        <PagingListComponent pageIndex={props.pageIndex} pageTotal={props.pageTotal} pageItemClick={(value) => handleItemClick(value)} />
        <PagingPostfixComponent pageIndex={props.pageIndex} pageTotal={props.pageTotal} pageItemClick={(value) => handleItemClick(value)} />
     </Pagination>
  );
}

export default memo(PagingComponent);