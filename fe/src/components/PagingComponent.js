import { memo, useEffect, useState } from "react";
import Pagination from 'react-bootstrap/Pagination';
import * as constants from '../jscode/constants';
import PagingItemComponent from "./PagingItemComponent";

function PagingComponent(props) {

  const [pageIndex, setPageIndex] =  useState(constants.page_first_default);
  const [pageTotal, setPageTotal] = useState(constants.page_total_default);

  function initStates() {          
    let varPageIndex = constants.page_first_default;
    let varPageTotal = constants.page_total_default;

    if (props.pageIndex != null && props.pageIndex !== undefined)
        varPageIndex = props.pageIndex;
    
    if (props.pageTotal != null && props.pageTotal !== undefined){}
        varPageTotal = props.pageTotal;

    setPageIndex(varPageIndex);
    setPageTotal(varPageTotal);
}

useEffect(() => { initStates()}, []);

  let active = "";
  let disabled = "";
  let isShow = true;
  let display = (isShow) ? '' : 'none';
  let styleItem = {
    display: {display},
  }
  let items=[];
  for (let number = 1; number <= 5; number++) {
    items.push(
      <Pagination.Item key={number} active={number === active}>
        {number}
      </Pagination.Item>,
    );
  }
  return (
    <div>
     <Pagination>
      {items}{items}
     </Pagination>
     <br />
    <Pagination>
      <Pagination.First />
      <Pagination.Prev />
      <Pagination.Item style={styleItem}>{1}</Pagination.Item>
      <PagingItemComponent text="2" />
      <Pagination.Ellipsis />

      <Pagination.Item onClick={(event) => props.paginationClicked(event.target.text)}>{10}</Pagination.Item>
      <Pagination.Item>{11}</Pagination.Item>
      <Pagination.Item active={active}>{12}</Pagination.Item>
      <Pagination.Item>{13}</Pagination.Item>
      <Pagination.Item disabled={disabled}>{14}</Pagination.Item>

      <Pagination.Ellipsis />
      <Pagination.Item>{20}</Pagination.Item>
      <Pagination.Next />
      <Pagination.Last />
    </Pagination>
    </div>
  );
}

export default memo(PagingComponent);