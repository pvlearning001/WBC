import * as constants from "./constants";

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