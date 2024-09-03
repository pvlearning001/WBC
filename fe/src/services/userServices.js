import axios from 'axios';
import * as constants from '../jscode/constants';
import { userListModel } from "../models/userListModel";
import { userModel } from '../models/userModel';

export async function getList(findText, sort, sortType, pageIndex) {
    let result = new userListModel();
    result.pageIndex = pageIndex;
    let token = localStorage.getItem(constants.token_string);
    const requestItem = {
        "findText": findText,
        "sort": sort,
        "sortType": sortType,
        "pageIndex": pageIndex,
    };

    await axios({ 
        // Endpoint to send files 
        url: "/users/list", 
        method: "POST", 
        headers: {   
            "Authorization" : `Bearer ${token}`
        }, 
        
        data: requestItem, 
    }) 
    .then((res) => {
        if (res.data.code === constants.api_code_success){
            result.pageTotal = res.data.result.pageTotal;
            let i = 0;
            let orderNo = 0;
            let id = 0;
            let uname = "";
            let fname = "";
            let mname = "";
            let lname = "";
            let email = "";
            let phone = "";
            let isResetPw = false;
            let pwReset = "";
            let rolesId = "";
            let rolesName = "";
            for (let item of res.data.result.pageResult) {
                i = i + 1;
                orderNo = i;
                id = item[0];
                uname = item[1];
                fname = item[2];
                mname = item[3];
                lname = item[4];
                email = item[5];
                phone = item[6];
                isResetPw = item[7];
                pwReset = item[8];
                rolesId = item[9];
                rolesName = item[10];               

                let usermodel = new userModel(id, uname, fname, mname, lname, email, phone, isResetPw, pwReset, rolesId, rolesName);
                //usermodel.setFMName();
                usermodel.setFullName();
                usermodel.setOrderNo(orderNo);
                result.dataList.push(usermodel);
            }
            
        }
    }) 
    .catch((err) => {
        console.log("Error: ", err);
    })
    return result;
}

export async function setDelete(id, deletedValue) {
    let result = "";
    let token = localStorage.getItem(constants.token_string);
    const requestItem = {
        "id": id,
        "deletedValue": deletedValue
    };

    await axios({ 
        // Endpoint to send files 
        url: "/users/delete", 
        method: "PUT", 
        headers: {   
            "Authorization" : `Bearer ${token}`
        }, 
        
        data: requestItem, 
    }) 
    .then((res) => {
        if (res.data.code === constants.api_code_success){
            result = res.data.result;
        }
    }) 
    .catch((err) => {
        console.log("Error: ", err);
    })
    return result;
}

export async function update(updateItem) {
    /*
    int userId;
    String userName;
    String fName;
    String mName;
    String lName;
    String email;
    String phone;
    String roles;

        this.id = id;
      this.uName = uname;
      this.fName = fname;
      this.mName = mname;
      this.fmName = "";
      this.fullName = "";
      this.lName = lname;
      this.email = email;
      this.phone = phone;
      this.isResetPw = is_reset_pw;
      this.pwReset = pw_reset;
      this.roles_id = roles_id; 
      this.roles_name = roles_name;
    */
    let result = "";
    let token = localStorage.getItem(constants.token_string);
    console.log(updateItem.fName, updateItem.mName, updateItem.lName);
    const requestItem = {
        "userId": updateItem.id,
        "userName": updateItem.uName,
        "firstName": updateItem.fName,
        "middleName": updateItem.mName,
        "lastName": updateItem.lName,
        "email": updateItem.email,
        "phone": updateItem.phone,
        "roles": updateItem.roles_id
    };

    await axios({ 
        // Endpoint to send files 
        url: "/users/update", 
        method: "PUT", 
        headers: {   
            "Authorization" : `Bearer ${token}`
        }, 
        
        data: requestItem, 
    }) 
    .then((res) => {
        if (res.data.code === constants.api_code_success){
            result = res.data.result;
            console.log(result);
        }
    }) 
    .catch((err) => {
        console.log("Error: ", err);
    })
    return result;
}

export function findItemInList(dataList, id){
    for (let dataItem of dataList) {
        if (dataItem.id === id)              
            return dataItem;                
    }
    return null;
}