import * as constants from "./constants";

export function isNullOrEmpty(text){ 
    let result = (text === null) || (text === constants.string_empty);
    return result;        
};

export function isNullOrEmptyOrSpace(text){ 
    if (text != null && text !== undefined)
        text = text.trim();
    let result = isNullOrEmpty(text);
    return result;        
};

export function getDetailsName(text){ 
    let result = [constants.string_empty, constants.string_empty, constants.string_empty];
    let tempArray = [];
    let tempTextItem = constants.string_empty;

    const textArray = text.split(constants.string_space); 
    console.log(textArray);
    for (const textItem of textArray) {
        tempTextItem = textItem.trim();
        if (!isNullOrEmpty(tempTextItem)) 
            tempArray.push(tempTextItem);
    } 

    let lenTempArr = tempArray.length;
    if (lenTempArr === 1) {
        result[0] = tempArray[0];
    }
    else if (lenTempArr === 2) {
        result[0] = tempArray[0];
        result[2] = tempArray[1];
    }
    else if (lenTempArr === 3) {
        result[0] = tempArray[0];
        result[1] = tempArray[1];
        result[2] = tempArray[2];
    }
    else if (lenTempArr > 3) {
        result[0] = tempArray[0];
        for (let i = 1; i < (lenTempArr - 1); i++) {
            result[1] += constants.string_space + tempArray[i];
        }
        result[1] = result[1].trim();
        result[2] = tempArray[lenTempArr - 1];
    }

    return result;        
};

export function isPwMatch(pw, pwRT){
    if (isNullOrEmptyOrSpace(pw) || isNullOrEmptyOrSpace(pwRT))
        return false;
    return (pw === pwRT);
}

export function isLogined(){ 
    const isLoginedString = localStorage.getItem(constants.token_isAuthenticated);
    const result = (isLoginedString === "true");
    return result;        
};

export function isAllowControl(rolesControl){    
    if (rolesControl ==  null
        || rolesControl === constants.string_empty
        || rolesControl === constants.string_space
    ){
        return true;
    }
    if (localStorage.getItem(constants.token_role == null)){
        localStorage.setItem(constants.token_role, constants.string_empty);
    }    	    
    const rolesControlArray = rolesControl.split(constants.string_space);    
    const roleUserString = localStorage.getItem(constants.token_role);
    const roleUserArray = roleUserString.split(constants.string_space);
    
    for (const roleUser of roleUserArray) { 
        for (const rolesControl of rolesControlArray){
            if (roleUser === rolesControl)
                return true;
        }
    }

    return false;

};

export function isAllowPage(pagePath){
    if (constants.page_list_public.indexOf(pagePath) > -1) 
        return true;   
    const roleString = localStorage.getItem(constants.token_role);
    const roleArray = roleString.split(constants.string_space);
    let result = false;

    for (const role of roleArray) { 
        if (role === constants.role_user) {
            result = (constants.page_list_user.indexOf(pagePath) > -1);                
        }

        if (role === constants.role_admin) {
            result = (constants.page_list_admin.indexOf(pagePath) > -1);                
        }

        if (result){
            break;
        }
    }
    return result;

};