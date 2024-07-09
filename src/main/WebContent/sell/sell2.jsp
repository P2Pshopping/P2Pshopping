  console.log("roadAddrPart2: " + roadAddrPart2);
    console.log("zipNo: " + zipNo);
    /* if (roadAddrPart1) {
        document.getElementById('roadAddrPart1').value = roadAddrPart1;
        document.getElementById('roadAddrPart1Display').value = roadAddrPart1;
    }
	@@ -240,7 +240,32 @@ document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('addrDetailDisplay').value = addrDetail;
    }
    if (roadAddrPart2) document.getElementById('roadAddrPart2').value = roadAddrPart2;
    if (zipNo) document.getElementById('zipNo').value = zipNo; */
    
    // 각각의 요소가 존재하는지 확인한 후 값을 설정합니다.
    if (roadAddrPart1) {
        var roadAddrPart1Element = document.getElementById('roadAddrPart1');
        var roadAddrPart1DisplayElement = document.getElementById('roadAddrPart1Display');
        if (roadAddrPart1Element) roadAddrPart1Element.value = roadAddrPart1;
        if (roadAddrPart1DisplayElement) roadAddrPart1DisplayElement.value = roadAddrPart1;
    }
    if (addrDetail) {
        var addrDetailElement = document.getElementById('addrDetail');
        var addrDetailDisplayElement = document.getElementById('addrDetailDisplay');
        if (addrDetailElement) addrDetailElement.value = addrDetail;
        if (addrDetailDisplayElement) addrDetailDisplayElement.value = addrDetail;
    }
    if (roadAddrPart2) {
        var roadAddrPart2Element = document.getElementById('roadAddrPart2');
        if (roadAddrPart2Element) roadAddrPart2Element.value = roadAddrPart2;
    }
    if (zipNo) {
        var zipNoElement = document.getElementById('zipNo');
        if (zipNoElement) zipNoElement.value = zipNo;
    }
    $('form').on('submit', function(event) {
        var productName = $('#productName').val();