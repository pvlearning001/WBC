import { memo } from "react";
import Pagination from 'react-bootstrap/Pagination';
import * as constants from '../jscode/constants';
import PagingItemComponent from "./PagingItemComponent";
import PagingPostfixComponent from "./PagingPostfixComponent";
import PagingPrefixComponent from "./PagingPrefixComponent";

function PagingTestComponent(props) {
  let active = "";
  let disabled = "";
  let isShow = true;
  let display = (isShow) ? '' : 'none';
  let styleItem = {
    display: {display},
  }
  let items=[];
  let pageIndex = 3;

  let pagingPrefix = [];
  pagingPrefix.push(<PagingItemComponent type={constants.page_type_first} isShow={true} pageItemClick={(key) => props.pageItemClicked(key)} />);
  pagingPrefix.push(<PagingItemComponent type={constants.page_type_prev} isShow={true} pageItemClick={(key) => props.pageItemClicked(key)} />); 

  let pagingPostfix = [];
  pagingPostfix.push(<PagingItemComponent type={constants.page_type_next} isShow={true} pageItemClick={(key) => props.pageItemClicked(key)} />);
  pagingPostfix.push(<PagingItemComponent type={constants.page_type_last} isShow={true} pageItemClick={(key) => props.pageItemClicked(key)} />);
  if (items.length == 0){
    for (let number = 1; number <= 5; number++) {
      if (number == pageIndex){
        items.push(
        <PagingItemComponent key={number} isActive={true} text={number} pageItemClick={(key) => props.pageItemClicked(key)} />);
      }
      else{
        items.push(
          <PagingItemComponent key={number} text={number} pageItemClick={(key) => props.pageItemClicked(key)} />
        );
      }
    }
  }


  return (
    <div>
     <Pagination>
        <PagingPrefixComponent isShowFirst={true} isShowPrev={true} pageItemClick={(key) => props.pageItemClicked(key)} /> 
        {items}
        <PagingPostfixComponent isShowLast={true} isShowNext={true} pageItemClick={(key) => props.pageItemClicked(key)} /> 
     </Pagination>
     <br />
    <Pagination>
      <Pagination.First />
      <Pagination.Prev />
      <Pagination.Item style={styleItem}>{1}</Pagination.Item>
      <PagingItemComponent text="2" />
      <Pagination.Ellipsis />

      <Pagination.Item onClick={(event) => props.pageItemClicked(event.target.text)}>{10}</Pagination.Item>
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

export default memo(PagingTestComponent);