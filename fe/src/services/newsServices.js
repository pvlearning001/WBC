import axios from 'axios';
import * as constants from '../jscode/constants';
import * as utils from "../jscode/utilities";
import { announcementListModel } from '../models/announcementListModel';
import { announcementModel } from '../models/announcementModel';
import { resultModel } from '../models/resultModel';

export async function getList(findText, sort, sortType, pageIndex) {
    let result = new announcementListModel();
    result.pageIndex = pageIndex;
    let token = localStorage.getItem(constants.token_string);
    const requestItem = {
        "cateId": constants.cateid_announcement,
        "findText": findText,
        "sort": sort,
        "sortType": sortType,
        "pageIndex": pageIndex,
    };
    await axios({ 
        url: "/news/admin/list", 
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
            for (let item of res.data.result.pageResult) {
                i = i + 1; 
                let model = new announcementModel(); 
                model.orderNo = i;
                model.id = item[0];
                model.subject = item[1];
                model.content = item[2];
                model.contentEx01 = item[3];
                model.contentEx02 = item[4];
                model.contentEx03 = item[5];
                model.contentEx04 = item[6];
                model.contentEx05 = item[7];
                model.contentEx06 = item[8];
                model.isShow = item[9];
                model.filesId = item[10];
                result.dataList.push(model);
            }
            
        }
    }) 
    .catch((err) => {
        console.log("Error: ", err);
    })
    return result;
}

export async function createNew(files, title, content, contentEx01) {    
    const formData = new FormData();
    let result = new resultModel();
    let token = localStorage.getItem(constants.token_string);
    formData.append('cateId', 1);
    formData.append('subject', title);
    formData.append('content', content);
    formData.append('contentEx01', contentEx01);
    if (files != null && files.length > 0) {
        for (const file of files)
            formData.append('files', file);
    }        
    
    await axios({        
        url: constants.api_news_create, 
        method: "POST", 
        headers: {   
            "Authorization" : `Bearer ${token}`,             
            "Content-Type": "multipart/form-data"
        },
        data: formData, 
      }) 
    .then((res) => {
        result.code = res.data.code;
        result.execResult = (res.data.code === constants.api_code_success);
        result.message = constants.mess_news_add_success;
    })
    .catch((err) => {
        result.code = err.data.code;
        result.execResult = false;
        result.message = err;
    }); 

    return result;
} 

export async function getLatestAnnouncement(){
    let result = new announcementModel();
    await axios.get(constants.api_get_latest_announcement)
    .then(res => {                
        //console.log(res.data.result);
        result.id = res.data.result.id;
        result.subject = res.data.result.subject;
        result.content = res.data.result.content;
        result.contentEx01 = res.data.result.contentEx01;
        result.contentEx02 = res.data.result.contentEx02;
        result.contentEx03 = res.data.result.contentEx03;
        result.contentEx04 = res.data.result.contentEx04;
        result.contentEx05 = res.data.result.contentEx05;
        result.contentEx06 = res.data.result.contentEx06;
        result.isShow = res.data.result.show;
        if (res.data.result.files != null
            && res.data.result.files !== undefined
            && (res.data.result.files.length > 0)){
            for (const file of res.data.result.files)
                result.files.push(file);
        }
    })
    .catch(error => {
        console.log("Error: ", error);
    });
    return result;
}

export async function getFileContent(fileId){
    let result =  "";
    const request = {
        id: fileId
    };
    await axios.post(constants.api_get_file_content_pdf, request)
    .then(res => {               
        result = utils.base64ToArrayBuffer(res?.data.result.fileContent);
        //return result;
    })
    .catch(error => {
        console.log("Error: ", error);
    });
    return result;
}