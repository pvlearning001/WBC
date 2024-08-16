import { memo, useEffect, useState } from "react";
import Pagination from 'react-bootstrap/Pagination';
import * as constants from "../jscode/constants";
import * as utils from "../jscode/utilities";

function PagingItemComponent(props) {
  const [key, setKey] = useState(constants.string_empty);
  const [type, setType] = useState(constants.page_type_item);  
  const [text, setText] = useState(constants.page_first_default);
  const [isDisabled, setIsDisabled] = useState(false); 
  const [isActive, setIsActive] = useState(false);

  function initStates() {   
        let varKey = constants.string_empty;       
        let varType = constants.page_type_item;       
        let varText = constants.page_first_default;
        let varIsDisabled = false; 
        let varIsActive = false;

        if (props.key != null && props.type !== undefined)
          varKey = props.key;

        if (props.type != null && props.type !== undefined)
            varType = props.type;
        
        if (props.text != null && props.text !== undefined){}
            varText = props.text;
        
        if (props.isDisabled != null && props.isDisabled !== undefined)
            varIsDisabled = props.isDisabled;
        
        if (props.isActive != null && props.isActive !== undefined)
            varIsActive = props.isActive;

        setKey(varKey);
        setType(varType);
        setText(varText);
        setIsDisabled(varIsDisabled);
        setIsActive(varIsActive);
  }

  useEffect(() => { initStates()}, []);

  const handleItemClick = (key) => {
    if (props.pageItemClick != null && props.pageItemClick !== undefined){
        props.pageItemClick(key);
    }
  }
  let disabledText = (isDisabled) ? constants.string_true : constants.string_empty;
  let activeText = (isActive) ? constants.string_true : constants.string_empty;

  let styleItem = {
  };

  if (type === constants.page_type_first){
    if (utils.isNullOrEmpty(key))
      setKey("first");
    return <Pagination.First key={key} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} />
  }
  else if (type === constants.page_type_last){
    if (utils.isNullOrEmpty(key))
      setKey("last");
    return <Pagination.Last key={key} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} />
  }
  else if (type === constants.page_type_prev){
    if (utils.isNullOrEmpty(key))
      setKey("prev");
    return <Pagination.Prev key={key} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} />
  }
  else if (type === constants.page_type_next){
    if (utils.isNullOrEmpty(key))
      setKey("next");
    return <Pagination.Next key={key} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} />
  }
  else if (type === constants.page_type_ellipsis){
    if (utils.isNullOrEmpty(key))
      setKey("ellip");
    return <Pagination.Ellipsis key={key} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} />
  }
  else{
    if (utils.isNullOrEmpty(key))
      setKey(text);
    return <Pagination.Item key={text} disabled={disabledText} active={activeText} style={styleItem} onClick={() => handleItemClick(key)} >{text}</Pagination.Item>
  }
}

export default memo(PagingItemComponent);