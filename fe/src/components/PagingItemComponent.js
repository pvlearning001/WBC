import { memo, useEffect, useState } from "react";
import Pagination from 'react-bootstrap/Pagination';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

function PagingItemComponent(props) {
  const [itemValue, setItemValue] = useState(constants.string_empty);
  const [type, setType] = useState(constants.page_type_item);  
  const [text, setText] = useState(constants.page_first_default);
  const [isDisabled, setIsDisabled] = useState(false); 
  const [isActive, setIsActive] = useState(false);

  function initStates() {   
        let varItemValue = constants.string_empty;       
        let varType = constants.page_type_item;       
        let varText = constants.page_first_default;
        let varIsDisabled = false; 
        let varIsActive = false;

        if (props.itemValue != null && props.itemValue !== undefined)
          varItemValue = props.itemValue;

        if (props.type != null && props.type !== undefined)
            varType = props.type;
        
        if (props.text != null && props.text !== undefined){}
            varText = props.text;
        
        if (props.isDisabled != null && props.isDisabled !== undefined)
            varIsDisabled = props.isDisabled;
        
        if (props.isActive != null && props.isActive !== undefined)
            varIsActive = props.isActive;

        setItemValue(varItemValue);
        setType(varType);
        setText(varText);
        setIsDisabled(varIsDisabled);
        setIsActive(varIsActive);
  }

  useEffect(() => { initStates()}, []);

  const handleItemClick = (itemValue) => {
    if (props.pageItemClick != null && props.pageItemClick !== undefined){
        props.pageItemClick(itemValue);
    }
  }
  let disabledText = (isDisabled) ? constants.string_true : constants.string_empty;
  let activeText = (isActive) ? constants.string_true : constants.string_empty;

  let styleItem = {
  };

  if (type === constants.page_type_first){
    if (utils.isNullOrEmpty(itemValue))
      setItemValue("first");
    return <Pagination.First itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} />
  }
  else if (type === constants.page_type_last){
    if (utils.isNullOrEmpty(itemValue))
      setItemValue("last");
    return <Pagination.Last itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} />
  }
  else if (type === constants.page_type_prev){
    if (utils.isNullOrEmpty(itemValue))
      setItemValue("prev");
    return <Pagination.Prev itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} />
  }
  else if (type === constants.page_type_next){
    if (utils.isNullOrEmpty(itemValue))
      setItemValue("next");
    return <Pagination.Next itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} />
  }
  else if (type === constants.page_type_ellipsis){
    if (utils.isNullOrEmpty(itemValue))
      setItemValue("ellip");
    return <Pagination.Ellipsis itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} />
  }
  else{
    if (utils.isNullOrEmpty(itemValue))
      setItemValue(text);
    return <Pagination.Item itemValue={itemValue} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(itemValue)} >{text}</Pagination.Item>
  }
}

export default memo(PagingItemComponent);