import { memo, useEffect, useState } from "react";
import * as constants from '../jscode/constants';
import PagingItemComponent from "./PagingItemComponent";

function PagingPrefixComponent(props) {
    const isShowDefault = true;    
    const [isShowFirst, setIsShowFirst] = useState(isShowDefault);
    const [isShowPrev, setIsShowPrev] = useState(isShowDefault);

    function initStates() {          
        let varIsShowFirst = isShowDefault;
        let varIsShowPrev = isShowDefault;

        if (props.isShowFirst != null && props.isShowFirst !== undefined)
            varIsShowFirst = props.isShowFirst;

        if (props.isShowPrev != null && props.isShowPrev !== undefined)
            varIsShowPrev = props.isShowPrev;

        setIsShowFirst(varIsShowFirst);
        setIsShowPrev(varIsShowPrev);
    }

    useEffect(() => { initStates()}, [props.isShowFirst, props.isShowPrev]);

    const handleItemClick = (key) => {
      if (props.pageItemClick != null && props.pageItemClick !== undefined){            
          props.pageItemClick(key);      }
    }

    let result = [];

    if (result.length == 0){

        if (isShowFirst)
            result.push(<PagingItemComponent type={constants.page_type_first} pageItemClick={(key) => handleItemClick(key)} />);
        if (isShowPrev)
            result.push(<PagingItemComponent type={constants.page_type_prev} pageItemClick={(key) => handleItemClick(key)} />); 
    }

    return result
}  
export default memo(PagingPrefixComponent);