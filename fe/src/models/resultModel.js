import * as constants from '../jscode/constants';
export class resultModel {
    constructor() {
        this.code = constants.api_code_success;
        this.execResult = false;
        this.messageExt = constants.string_empty;
        this.messageExt = [];
    }
}