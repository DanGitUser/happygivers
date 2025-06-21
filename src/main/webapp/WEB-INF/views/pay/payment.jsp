<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PortOne 테스트 결제</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<h2>테스트 결제 페이지</h2>
	<button onclick="requestPay()">결제하기</button>

	<script>
		function requestPay() {
			var IMP = window.IMP;
			IMP.init("imp81546744");

			IMP.request_pay({
				pg : "kakaopay.TC0ONETIME",
				pay_method : "card",
				merchant_uid : "order_" + new Date().getTime(),
				name : "테스트 상품",
				amount : 1000,
				buyer_email : "test@example.com",
				buyer_name : "홍길동",
				buyer_tel : "010-1234-5678",
				buyer_addr : "서울 강남구 역삼동",
				buyer_postcode : "12345"
			}, function(rsp) {
				if (rsp.success) {
					alert("결제 성공: imp_uid = " + rsp.imp_uid);
				} else {
					alert("결제 실패: " + rsp.error_msg);
				}
			});
		}
	</script>
</body>
</html>
