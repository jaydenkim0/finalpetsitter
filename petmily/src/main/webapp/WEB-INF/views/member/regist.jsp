<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=534248faec0557257f5c7cc9e504a2da&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(function(){
        	jQuery('#selectBox').change(function(){
        		var state = jQuery('#selectBox option:selected').val();
        		if(state=='예'){
        			jQuery('.pet').show();
        		}else{
        			jQuery('.pet').hide();
        		}
        	});
        	
        	$("#user_id").blur(function(){
 				var user_id = $("#user_id").val();
 				
 				$.ajax({
 					url:'${pageContext.request.contextPath}/member/idCheck?userId='+user_id,
 					type:'get',
 					success : function(data){
 						if(data == 0) {
 							$("#id_check").text("");
 							$("#submit").attr("disabled",false);
 						}else{
 							$("#id_check").text("사용중인 아이디입니다");
 							$('#id_check').css('color', 'red');
 							$("#submit").attr("disabled",true);
 						}
 					}
 				});
            });
        	
        	$("#selectBox").change(function(){	
        		$(".petnamecheck").hide();
        		$(".petagecheck").hide();
        		var select = $("select[name=pets]").val();
        		if(select=='예'){
        			$("#submit").attr("disabled",true);
        			$(".petname").blur(function(){
        				var petname = $(".petname").val();
        				if(petname==""){
        					$(".petnamecheck").show();
        				}else{
        					$(".petnamecheck").hide();
        					$("#submit").attr("disabled",false);
        				}	
        			});
        			$(".petage").blur(function(){
        				$("#submit").attr("disabled",true);
        				var petage = $(".petage").val();
        				var regex =  /[0-9]+/g;
        				var a = regex.test(petage);
        				if(!a){
        					$("#submit").attr("disabled",true);
        					$(".petagecheck").show();
        				}else{
        					$("#submit").attr("disabled",false);
        					$(".petagecheck").hide();
        				}
        			});
        		}else{
        			$("#submit").attr("disabled",false);
        		}
        	});  
        	$(".phonecheck").hide();
        	$(".phone").blur(function(){
        		$("#submit").attr("disabled",true);
        		var phone = $(".phone").val();
        		var regex = /^[0-9]{9,11}$/
        		var b = regex.test(phone);
        		if(!b){
        			$(".phonecheck").show();
        			$("#submit").attr("disabled",true);
        		}else{
        			$(".phonecheck").hide();
        			$("#submit").attr("disabled",false);
        		}
        	});
        	
        	$(".emailcheck").hide();
        	$(".email").blur(function(){
        		$("#submit").attr("disabled",true);
        		var email = $(".email").val();
        		var regex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        		var c = regex.test(email);
        		if(!c){
        			$(".emailcheck").show();
        			$("#submit").attr("disabled",true);
        		}else{
        			$(".emailcheck").hide();
        			$("#submit").attr("disabled",false);
        		}
        	});
        });
    </script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
// 	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
// 	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
    <style>
    	.pet{display:none;}
    	.petnamecheck{display:none;}
    </style>
</head>

<body>
<div align="center">
	
	<h2>회원가입</h2>
	
	<form action="regist" method="post" onsubmit="onsubmit_petnamecheck();" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" placeholder="아이디" required id="user_id">
				<div id="id_check"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pw" placeholder="비밀번호" required>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" placeholder="이름" required>
			</td>
		</tr>
		
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="nick" placeholder="닉네임" required>
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" placeholder="이메일" required class="email">
				<p class="emailcheck">이메일 형식이 잘못되었습니다</p>
			</td>
		</tr>
		
		
		<tr>
			<th>전화번호</th>
			<td>
				<input type="tel" name="phone" placeholder="전화번호" required class="phone">
				<p class="phonecheck">00000000000(숫자 11개) 형식으로 작성해주세요</p>
			</td>
		</tr>
		
		<tr>
			<th rowspan="3">주소</th>
			<td>
				<input type="text" id="sample6_postcode" name="post" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_address" name="basic_addr" size="50" placeholder="기본주소">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text"  id="sample6_detailAddress" name="extra_addr" size="50" placeholder="상세주소">
			</td>
		</tr>
		
		<!-- 사진첨부 -->
		
		<tr>
			<th>프로필사진</th>
			<td>
				<input type="file" name="member_image" multiple accept="image/*">
			</td>
		</tr>
		
		
		<tr>
			<th colspan="2">반려동물이 있으신가요?		
			 		<select name="pets" id="selectBox">
			 			<option value="아니오">아니오</option>			 		
			 			<option value="예">예</option>
			 		</select>
			</th>
		</tr>		
		<tr class="pet">
			<th colspan="2">
				<table>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="pet_name" class="petname">
							<p class="petnamecheck">이름은 필수 입력 항목입니다.</p>
						</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>
							<input type="text" name="pet_age" class="petage">
							<p class="petagecheck">숫자를 입력해주세요</p>
						</td>
					</tr>
					<tr>
						<th>동물종</th>
						<td>
							<select name="pet_type">
			 					<option>강아지</option>			 		
			 					<option>고양이</option>
			 					<option>물고기</option>			 		
			 					<option>토끼</option>
			 					<option>햄스터</option>			 		
			 					<option>파충류</option>
			 				</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td>
							<textarea name="pet_ect"></textarea>
						</td>
					</tr>
					<tr>
						<th>이미지 첨부</th>
						<td>
							<input type="file" name="pet_image" multiple accept="image/*">S
						</td>
					</tr>
				</table>
			</th>
		</tr>
		
		<tr> 
			<th colspan="2">
				<input type="submit" value="가입하기" id="submit">
				<input type="reset" value="지우기">
			</th>
		</tr>
	</table>
	</form>
	
</div>

<br><br><br>
</body>

