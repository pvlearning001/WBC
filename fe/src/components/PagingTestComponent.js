import { memo, useCallback } from "react";
import Pagination from 'react-bootstrap/Pagination';
import PagingListComponent from "./PagingListComponent";
import PagingPostfixComponent from "./PagingPostfixComponent";
import PagingPrefixComponent from "./PagingPrefixComponent";

function PagingTestComponent(props) {

  const handleItemClick = useCallback((value) => {    
    if (props.pageItemClick != null && props.pageItemClick !== undefined){
        props.pageItemClick(value);      
    }
  }, []);


  return (
     <Pagination>
        <PagingPrefixComponent pageIndex={3} pageTotal={5} pageItemClick={(value) => handleItemClick(value)} />
        <PagingListComponent pageIndex={3} pageTotal={5} pageItemClick={(value) => handleItemClick(value)} />
        <PagingPostfixComponent pageIndex={3} pageTotal={5} pageItemClick={(value) => handleItemClick(value)} />
     </Pagination>
  );
}

export default memo(PagingTestComponent);