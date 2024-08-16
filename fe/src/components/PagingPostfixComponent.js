import { memo, useEffect, useState } from "react";
import * as constants from '../jscode/constants';
import PagingItemComponent from "./PagingItemComponent";

function PagingPostfixComponent(props) {
    const isShowDefault = true;    
    const [isShowLast, setIsShowLast] = useState(isShowDefault);
    const [isShowNext, setIsShowNext] = useState(isShowDefault);

    function initStates() {          
        let varIsShowLast = isShowDefault;
        let varIsShowNext = isShowDefault;

        if (props.isShowLast != null && props.isShowLast !== undefined)
            varIsShowLast = props.isShowLast;

        if (props.isShowNext != null && props.isShowNext !== undefined)
            varIsShowNext = props.isShowNext;

        setIsShowLast(varIsShowLast);
        setIsShowNext(varIsShowNext);
    }

    useEffect(() => { initStates()}, [props.isShowLast, props.isShowNext]);


    const handleItemClick = (key) => {
        if (props.pageItemClick != null && props.pageItemClick !== undefined){            
            props.pageItemClick(key);      }
      }

    let result = [];

    if (result.length == 0){
        if (isShowNext)
            result.push(<PagingItemComponent type={constants.page_type_next} isShow={isShowNext} pageItemClick={(key) => handleItemClick(key)} />);

        if (isShowLast)
            result.push(<PagingItemComponent type={constants.page_type_last} isShow={isShowLast} pageItemClick={(key) => handleItemClick(key)} />);
    }
    return result
}  
export default memo(PagingPostfixComponent);