<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action=account method="post">
	<!-- reservation_no -->
	<input type="text" name="partner_order_id" value="44" placeholder="주문번호"><br><br>
	<!-- member_id -->
	<input type="text" name="partner_user_id" value="122" placeholder="사용자번호"><br><br>
	<!-- petsitter_no -->
	<input type="text" name="item_name" value="죠르디이" placeholder="상품명"><br><br>
	<!-- usage_time_start -->
	<input type="text" name="quantity" value="1" placeholder="수량"><br><br>
	<!-- payMent -->
	<input type="text" name="total_amount" value="9900" placeholder="총 가격"><br><br>
	<!-- hidden type -->
	<input type="text" name="vat_amount" value="990" placeholder="부가세"><br><br>
	<!--  -->
	<input type="text" name="tax_free_amount" value="0" placeholder="비과세"><br><br>
	<input type="submit" value="최종 결제하기">
</form>