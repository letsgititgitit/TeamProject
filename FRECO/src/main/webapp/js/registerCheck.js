/**
 * 
 */
	function validate(){
    
	//아이디
	if (f.MID.value == "") {
        alert("아이디를 입력하지 않았습니다.")
        f.MID.focus();
        return false;
    }
    for (var i = 0; i < document.f.MID.value.length; i++) {
        ch = document.f.MID.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
            document.f.MID.focus();
            document.f.MID.select();
            return false;
        }
    }
    if (document.f.MID.value.length<5 || document.f.MID.value.length>12) {
        alert("아이디를 5~12자까지 입력해주세요.")
        document.f.MID.focus();
        document.f.MID.select();
        return false;
    }
    if (document.f.MID.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.f.MID.focus();
        document.f.MID.select();
        return false;
    }
    
    //비밀번호
    if (f.MPW.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        f.MPW.focus();
        return false;
    }    
    if (f.confirmMPW.value == "") {
        alert("비밀번호 확인을 입력하지 않았습니다.")
        f.confirmMPW.focus();
        return false;
    } 
    if (document.f.MPW.value.length<4 || document.f.MPW.value.length>12) {
        alert("비밀번호를 4~12자까지 입력해주세요.")
        document.f.MPW.focus();
        document.f.MPW.select();
        return false;
    }  
    if (document.f.MPW.value != document.f.confirmMPW.value) {
       alert("비밀번호가 일치하지 않습니다")
       document.f.confirmMPW.value = ""
       document.f.confirmMPW.focus();
       return false;
        }
    if (f.MPW.value == f.MID.value) {
        alert("아이디와 다른 비밀번호를 설정해주세요")
        document.f.MPW.focus();
        return false;
    }
    //이름
    if (f.MNAME.value == "") {
        alert("이름을 입력하지 않았습니다.")
        f.MNAME.focus();
        return false;
    }
    if(document.f.MNAME.value.length<2){
        alert("이름을 2글자 이상 입력해주세요.")
        document.f.MNAME.focus();
        return false;
    }
    //생일
    if (f.MBIRTH.value == "") {
        alert("생일을 입력하지 않았습니다.")
        f.MBIRTH.focus();
        return false;
    }
    for (var i = 0; i < document.f.MBIRTH.value.length; i++) {
        ch = document.f.MBIRTH.value.charAt(i)
        if (!(ch >= '0' && ch <= '9')) {
            alert("생일은 숫자만 입력가능합니다.")
            document.f.MBIRTH.focus();
            document.f.MBIRTH.select();
            return false;
        }
    }
    if(document.f.MBIRTH.value.length>7 || document.f.MBIRTH.value.length<5){
        alert("생일은 YYMMDD로 입력해주세요(ex.710924).")
        document.f.MBIRTH.select();
        document.f.MBIRTH.focus();
        return false;
    }
    //휴대폰번호
    if (f.MPHONE.value == "") {
        alert("휴대폰번호를 입력하지 않았습니다.")
        f.MPHONE.focus();
        return false;
    }
    for (var i = 0; i < document.f.MPHONE.value.length; i++) {
        ch = document.f.MPHONE.value.charAt(i)
        if (!(ch >= '0' && ch <= '9')) {
            alert("휴대폰번호는 숫자만 입력가능합니다.")
            document.f.MPHONE.focus();
            document.f.MPHONE.select();
            return false;
        }
    }
    if(document.f.MPHONE.value.length>11 || document.f.MPHONE.value.length<10){
        alert("휴대폰번호를 다시 확인해주세요.")
        document.f.MPHONE.select();
        document.f.MPHONE.focus();
        return false;
    }
    //우편번호,주소
    if (f.MADDRESS1.value == "") {
        alert("우편번호를 입력하지 않았습니다.")
        f.MADDRESS1.focus();
        return false;
    } 
    if (!isNumeric(MADDRESS1)) {
        alert("우편번호는 숫자로 입력하세요.");
        document.f.MADDRESS1.value = "";
        document.f.MADDRESS1.focus();
        return false;
    }
    if (f.MADDRESS2.value == "") {
        alert("주소를 입력하지 않았습니다.")
        f.MADDRESS2.focus();
        return false;
    }        
    if (f.MADDRESS3.value == "") {
        alert("상세주소를 입력하지 않았습니다.")
        f.MADDRESS3.focus();
        return false;
    } 
} 


    
    

 