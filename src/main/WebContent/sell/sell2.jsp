<script>
document.addEventListener('DOMContentLoaded', function() {
    // 세션 저장된 데이터를 로드하여 폼에 설정합니다.
    var roadAddrPart1 = sessionStorage.getItem('roadAddrPart1');
    var addrDetail = sessionStorage.getItem('addrDetail');
    var roadAddrPart2 = sessionStorage.getItem('roadAddrPart2');
    var zipNo = sessionStorage.getItem('zipNo');

    // Debugging logs
    console.log("roadAddrPart1: " + roadAddrPart1);
    console.log("addrDetail: " + addrDetail);
    console.log("roadAddrPart2: " + roadAddrPart2);
    console.log("zipNo: " + zipNo);

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
        var productDescription = $('#productDescription').val();
        var price = $('#price').val();
        var files = $('#productImages')[0].files;

        if (!productName || !productDescription || !price) {
            alert('상품명, 상품설명, 가격을 모두 입력해주세요.');
            event.preventDefault();
        } else if (files.length > 4) {
            alert('최대 4개의 이미지만 업로드할 수 있습니다.');
            event.preventDefault();
        }
    });
});
</script>

