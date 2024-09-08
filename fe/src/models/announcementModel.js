export class announcementModel {
    constructor() {
        this.orderNo = 0;
        this.id = 0;        
        this.subject = "";
        this.content = "";
        this.contentMini = "";
        this.contentEx01 = "";
        this.contentEx02 = "";
        this.contentEx03 = "";
        this.contentEx04 = "";
        this.contentEx05 = "";
        this.contentEx06 = "";
        this.isShow = false;
        this.showText = "";
        this.filesId = "";
        this.files = [];
    }

    setContentMini(){
        this.contentMini = this.content.substring(0, 36)+ "...";
    }

    setShowText(){
        if (this.isShow)
            this.showText = "Hiển thị";
    }

    setProperties(){
        this.setContentMini();
        this.setShowText();
    }
}