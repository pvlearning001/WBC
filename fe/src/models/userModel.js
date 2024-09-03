import * as utils from '../jscode/utilities';
export class userModel {
    constructor(id, uname, fname, mname, lname, email, phone, is_reset_pw, pw_reset, roles_id, roles_name) {
      this.orderNo = 0;
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
    }

    setOrderNo(orderNo) {
      this.orderNo = orderNo;
    }

    setFMName() {
      this.fmName = utils.buildFMName(this.fName, this.mName);
    }    

    setFullName() {
      this.fmName = utils.buildFMName(this.fName, this.mName);
      this.fullName = utils.buildFullName(this.fName, this.mName, this.lName);
    }
}