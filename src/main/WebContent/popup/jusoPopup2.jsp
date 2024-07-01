<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
	String engAddr = request.getParameter("engAddr"); 
	String jibunAddr = request.getParameter("jibunAddr"); 
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail"); 
	String admCd    = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn  = request.getParameter("bdMgtSn");
	String detBdNmList  = request.getParameter("detBdNmList");	
	/** 2017년 2월 추가제공 **/
	String bdNm  = request.getParameter("bdNm");
	String bdKdcd  = request.getParameter("bdKdcd");
	String siNm  = request.getParameter("siNm");
	String sggNm  = request.getParameter("sggNm");
	String emdNm  = request.getParameter("emdNm");
	String liNm  = request.getParameter("liNm");
	String rn  = request.getParameter("rn");
	String udrtYn  = request.getParameter("udrtYn");
	String buldMnnm  = request.getParameter("buldMnnm");
	String buldSlno  = request.getParameter("buldSlno");
	String mtYn  = request.getParameter("mtYn");
	String lnbrMnnm  = request.getParameter("lnbrMnnm");
	String lnbrSlno  = request.getParameter("lnbrSlno");
	/** 2017년 3월 추가제공 **/
	String emdNo  = request.getParameter("emdNo");

%>
</head>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

/*
		모의 해킹 테스트 시 팝업API를 호출하시면 IP가 차단 될 수 있습니다. 
		주소팝업API를 제외하시고 테스트 하시기 바랍니다.
*/



function init() {
    var url = location.href;
    var confmKey = "U01TX0FVVEgyMDI0MDYxNjIyNDUwMDExNDg0NTc=";
    var resultType = "4"; // 도로명주소 검색결과 화면 출력내용

    var inputYn = "<%=inputYn%>";
    if (inputYn != "Y") {
        document.form.confmKey.value = confmKey;
        document.form.returnUrl.value = url;
        document.form.resultType.value = resultType;
        document.form.action = "https://business.juso.go.kr/addrlink/addrLinkUrl.do"; // 인터넷망
        // document.form.action="https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do"; // 모바일 웹인 경우, 인터넷망
        document.form.submit();
    } else {
        // 주소 선택 완료 후 동작
        var roadFullAddr = "<%=roadFullAddr%>";
        var roadAddrPart1 = "<%=roadAddrPart1%>";
        var addrDetail = "<%=addrDetail%>";
        var roadAddrPart2 = "<%=roadAddrPart2%>";
        var engAddr = "<%=engAddr%>";
        var jibunAddr = "<%=jibunAddr%>";
        var zipNo = "<%=zipNo%>";
        var admCd = "<%=admCd%>";
        var rnMgtSn = "<%=rnMgtSn%>";
        var bdMgtSn = "<%=bdMgtSn%>";
        var detBdNmList = "<%=detBdNmList%>";
        var bdNm = "<%=bdNm%>";
        var bdKdcd = "<%=bdKdcd%>";
        var siNm = "<%=siNm%>";
        var sggNm = "<%=sggNm%>";
        var emdNm = "<%=emdNm%>";
        var liNm = "<%=liNm%>";
        var rn = "<%=rn%>";
        var udrtYn = "<%=udrtYn%>";
        var buldMnnm = "<%=buldMnnm%>";
        var buldSlno = "<%=buldSlno%>";
        var mtYn = "<%=mtYn%>";
        var lnbrMnnm = "<%=lnbrMnnm%>";
        var lnbrSlno = "<%=lnbrSlno%>";
        var emdNo = "<%=emdNo%>";

        // 디버깅 로그 추가
        console.log("init called");
        console.log("roadFullAddr: " + roadFullAddr);
        console.log("roadAddrPart1: " + roadAddrPart1);
        console.log("addrDetail: " + addrDetail);
        console.log("zipNo: " + zipNo);

        // 부모 창으로 주소 정보 전달
        opener.jusoCallBack2(roadAddrPart1, addrDetail, zipNo);

        // 팝업 닫기
        window.close();
    }
}


</script>
<body onload="init();">

	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>