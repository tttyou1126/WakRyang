function gfn_isNull(str) {
	if (str == null)
		return true;
	if (str == "NaN")
		return true;
	if (new String(str).valueOf() == "undefined")
		return true;
	var chkStr = new String(str);
	if (chkStr.valueOf() == "undefined")
		return true;
	if (chkStr == null)
		return true;
	if (chkStr.toString().length == 0)
		return true;
	return false;

}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	if (this.formId == "commonForm") {
		$("#commonForm")[0].reset();
	}
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	this.addParam = function addParam(key, value) {
		$("#" + this.formId).append(
				$("<input type='hidden' name='" + key + "' id='" + key
						+ "' value='" + value + "' >"));
	};
	this.submit = function submit() {
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
	
	this.empty = function empty() { // 210504 파일 다운로드 (addparam할 시 뒤에 파일명 덧붙여지므로 초기화 필요)
		$("#" + this.formId).empty();
	};
	
}



//이미지 파일 여부 판단
function checkImageType(fileName){
    var pattern = /jpg|gif|png|jpeg/i;
    return fileName.match(pattern);
}

// 업로드 파일 정보
function getFileInfo(fullName){
    var fileName, imgsrc, getLink, fileLink;
    // 이미지 파일일 경우
    if(checkImageType(fullName)){
        // 이미지 파열 경로(썸네일)
        imgsrc = "/first/src/main/webapp/images/upload="+fullName;
        console.log(imgsrc);
        // 업로드 파일명
        fileLink = fullName.substr(14);
        console.log(fileLink);
        // 날짜별 디렉토리 추출
        var front = fullName.substr(0, 12);
        console.log(front);
        // s_를 제거한 업로드이미지파일명
        var end = fullName.substr(14);
        console.log(end);
        // 원본이미지 파일 디렉토리
        getLink = "/first/src/main/webapp/images/upload="+front+end;
        console.log(getLink);
    // 이미지 파일이 아닐경우
    } else {
        // UUID를 제외한 원본파일명
        fileLink = fullName.substr(12);
        console.log(fileLink);
        // 일반파일디렉토리 
        getLink = "/first/src/main/webapp/images/upload="+fullName;
        console.log(getLink);
    }
    // 목록에 출력할 원본파일명
    fileName = fileLink.substr(fileLink.indexOf("_")+1);
    console.log(fileName);
    // { 변수:값 } json 객체 리턴
    return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}
