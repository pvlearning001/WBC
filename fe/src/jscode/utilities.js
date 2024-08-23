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

    let role = localStorage.getItem(constants.token_role);
    if (role == null) {
        initStorage();
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
    if (isTokenTimeoutExpired()){
        initStorage();
        return false;   
    }        
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

export function initStorage(){
    localStorage.setItem(constants.token_isAuthenticated, false);
    localStorage.setItem(constants.token_string, constants.string_empty);
    localStorage.setItem(constants.token_userName, constants.string_empty);
    localStorage.setItem(constants.token_role, constants.string_empty);
    localStorage.setItem(constants.token_expTime, 0); 
    localStorage.setItem(constants.token_fullName, constants.string_empty);
    localStorage.setItem(constants.token_userId, 0);
}

export function isTokenTimeoutExpired() {
    let role = localStorage.getItem(constants.token_role);
    if (role == null) {
        initStorage();
    }
    let token_expTime_string = localStorage.getItem(constants.token_expTime);
    let token_expTime = Number(token_expTime_string);
    let currentTime = new Date().getTime();    
    return (currentTime > token_expTime);
}

export function buildPageSession(pageIndex, pageTotal){
    pageIndex = parseInt(pageIndex);
    pageTotal = parseInt(pageTotal);
    let pageMin = parseInt(constants.page_first_default);
    let pageMax = parseInt(constants.page_session_default);
    let div = parseInt(Math.floor(constants.page_session_default / 2));

    if (pageIndex <= 3){
        pageMin = 1;
    }
    else if(pageIndex > (pageTotal - div)){
        pageMin = pageTotal + 1 - constants.page_session_default;
        pageMax = pageTotal;
    }
    else{
        pageMin = pageIndex - div;
        pageMax = pageIndex + div;
    }

    pageMin = (pageMin < 1) ? 1 : pageMin;
    pageMax = (pageMax > pageTotal) ? pageTotal : pageMax;

    let result = [];
    if (pageMax > 1){
        for (let page = pageMin; page <= pageMax; page++) { 
            result.push(page);
        }
    }
return result;
}

export const isJsonBlob = (data) => {
    return (data instanceof Blob && data.type === "application/json");
}

export const isBlobData = (data) => {
    return (data instanceof Blob);
}

export function base64ToByteArray(base64) {
    let binaryString = atob(base64);
    let result = new Uint8Array(binaryString.length);
    for (let i = 0; i < binaryString.length; i++) {
        result[i] = binaryString.charCodeAt(i);
    }
    return result;    
}

export function base64ToArrayBuffer(base64) {
    let byteArray = base64ToByteArray(base64);
    return byteArray.buffer;
}

export function buildFMName(fname, mname) {
    let result = fname;
    if (!isNullOrEmptyOrSpace(mname))
        result = result + constants.string_space + mname;
    return result;
}

export function buildFullName(fname, mname, lname) {
    let result = buildFMName(fname, mname);
    if (!isNullOrEmptyOrSpace(lname))
        result = result + constants.string_space + lname;
    return result;
}