<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    

<!-- 
기본 CSS
:	font css
	regist css
-->
	<!-- regist css -->
    <link rel="stylesheet" href="${context}/resources/css/regist.css"/>   
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    
<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>
    <!-- header style -->
    <style>
	#masthead:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  width: 100%;
	  height: 130px;
	  background-color: #fff;
	  opacity: 100;
	  transition: opacity 0.3s ease;
	}
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
	padding-top:150px;
	}
	</style>

<!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lib/toast/css/codemirror.min.css">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lib/toast/css/github.min.css">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lib/toast/dist/tui-editor.min.css">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
<!-- 네이버 토스트에디터 종료 -->

<!-- 네이버 토스트 에디터 스크립트 -->
<script>
	$(function() {
		//생성은 항상 옵션 먼저 + 나중에 생성
		var options = {
			//대상
			el : document.querySelector(".naver-editor"),
			//미리보기 스타일(vertical / horizontal)
			previewStyle : "horizontal",
			//입력 스타일
			initialEditType : "wysiwyg",
			//높이
			height : "300px"
		};

		var editor = tui.Editor.factory(options);

		//에디터의 값이 변하면 뒤에 있는 input[type=hidden]의 값이 변경되도록 처리
		editor
				.on(
						"change",
						function() {
							var text = editor.getValue();//에디터에 입력된 값을 불러온다
							document
									.querySelector(".naver-editor + input[type=hidden]").value = text;
						});
	});
</script>
<!-- 네이버 토스트 에디터 스크립트 종료 -->
	<script>
	 $(function(){
//다중 선택 출력 스크립트 		 
         $("input[type=checkbox]").change(function() {
             //배열 선언
             var skillArray = [];
             var carePetTypeArray = [];
             var careConditionArray = [];

             //체크박스에 체크된 경우
             var skillCheck = $('.skill > input[type=checkbox]:checked');
             var typeCheck = $('.type > input[type=checkbox]:checked');
             var conditionCheck = $('.condition > input[type=checkbox]:checked');

             //반복해서 데이터를 배열에 저장해라
             $(skillCheck).each(function(i){ //스킬
                 skillArray.push($(this).data("skills"));
             });

             $(typeCheck).each(function(i){ //동물종류
                 carePetTypeArray.push($(this).data("animal"));
             });

             $(conditionCheck).each(function(i){ //돌봄환경
                 careConditionArray.push($(this).data("condition"));
             });
				
             
             
                 $("#skills_text").empty();
                 for (var i in skillArray)
                 {
                	 var choose = $("<span>").addClass('choose-item');
                	 choose.text("# "+skillArray[i]).appendTo("#skills_text");
                 }
  
                 $("#care_pet_type_text").empty();
                 for (var i in carePetTypeArray)
                 {
                	 var choose = $("<span>").addClass('choose-item');
                	 choose.text("# "+carePetTypeArray[i]).appendTo("#care_pet_type_text");
                 }

                 $("#care_condition_text").empty();
                 for (var i in careConditionArray)
                 {
                	 var choose = $("<span>").addClass('choose-item');
                	 choose.text("# "+careConditionArray[i]).appendTo("#care_condition_text");
                 }               
         });
         
//지역 관리 스크립트
         $.ajax({
             url:"../resources/json/petmily_location.json", 
             type:"get",             
             dataType:"json",       
             success:function(resp){ 
             for(var i in resp){
                 $("<option>").text(i).appendTo(".region");
                 }    
             }
         });

         $(".region").change(function(){
             var region_text = $(this).children("option:selected").text();
             console.log("시 : "+ region_text);
             var city=$(this).val();

             $.ajax({
                     url:"../resources/json/petmily_location.json",  
                     type:"get",             
                     dataType:"json",       
                     success:function(resp){ 
                         $(".section").empty();
                         $(resp[city]).each(function(){
                             $("<option>").text(this).appendTo(".section");
                             });
                     }
                 });
         });

         $(".section").change(function(){
             var section_text = $(this).children("option:selected").text();
             console.log("군,구 : "+section_text);
         });  

//-----------------지역 추가 코드-----------------
         $("#add-btn").click(function(e){
             e.preventDefault();

             var region_len = $(".region").length; 
             console.log(region_len);

             var section_len = $(".region").length; 
             console.log(section_len);

             var test = $("<div>").addClass('location-div');

             var region = $("<select>");
                 region.addClass("region");
                 region.attr("name","location_name["+region_len+"].city");

             var section = $("<select>");
                 section.addClass("section");
                 section.attr("name","location_name["+section_len+"].area");

             var button = $("<button>").text("삭제").addClass('delete-btn');  
                   
             $.ajax({
                 url:"../resources/json/petmily_location.json",   
                 type:"get",             
                 dataType:"json",       
                 success:function(resp){ 
                 for(var n in resp){
                     $("<option>").text(n).appendTo(region);
                     region.appendTo(test);   
                 }

             $(region).change(function(){
                 var add_region = $(this).children("option:selected").text();
                 console.log("추가_시 : "+add_region);

                 var city=$(this).val();

                 $.ajax({
                     url:"../resources/json/petmily_location.json", 
                     type:"get",             
                     dataType:"json",       
                     success:function(resp){ 

                         $(section).empty();

                         $(resp[city]).each(function(){
                             // console.log(this);
                             $("<option>").text(this).appendTo(section);
                                 section.appendTo(test);
                                 button.appendTo(test);
                         });
                     } 
                 });
             });
             test.appendTo("#result"); 
                 }
             });     
             $(section).change(function(){
                 var add_section = $(this).children("option:selected").text();
                 console.log("추가_군,구 : "+add_section);

             $(button).click(function(){
                 test.remove();
             });    
             });  
         });
     });
	</script>
	
	<script>
		$(function(){
	        $("input[type=checkbox]").click(function(){
	            calcurate();
	        });
	    });
	
	    function calcurate(){
	        $("input[name=care_condition_name]").removeAttr("disabled");
	
	        if($("#아파트").is(":checked")){
	                $("#빌라").attr("disabled",true);
	                $("#빌라").attr("checked", false);
	                $("#원룸").attr("disabled",true);
	                $("#원룸").attr("checked", false);
	                $("#주택").attr("disabled",true);
	                $("#주택").attr("checked", false);
	        }
	        if($("#빌라").is(":checked")){
                $("#아파트").attr("disabled",true);
                $("#아파트").attr("checked", false);
                $("#원룸").attr("disabled",true);
                $("#원룸").attr("checked", false);
                $("#주택").attr("disabled",true);
                $("#주택").attr("checked", false);
        	}
	        if($("#원룸").is(":checked")){
                $("#아파트").attr("disabled",true);
                $("#아파트").attr("checked", false);
                $("#빌라").attr("disabled",true);
                $("#빌라").attr("checked", false);
                $("#주택").attr("disabled",true);
                $("#주택").attr("checked", false);
        	}
	        if($("#주택").is(":checked")){
                $("#아파트").attr("disabled",true);
                $("#아파트").attr("checked", false);
                $("#빌라").attr("disabled",true);
                $("#빌라").attr("checked", false);
                $("#원룸").attr("disabled",true);
                $("#원룸").attr("checked", false);
        	}
	
	        if($("#해당사항없음").is(":checked")){
	            $("#아파트").attr("disabled",true);
	            $("#아파트").attr("checked", false);
	            $("#빌라").attr("disabled",true);
	            $("#빌라").attr("checked", false);
	            $("#원룸").attr("disabled",true);
	            $("#원룸").attr("checked", false);
	            $("#주택").attr("disabled",true);
	            $("#주택").attr("checked", false);
	            $("#아기있음").attr("disabled",true);
	            $("#아기있음").attr("checked", false);
	            $("#흡연자").attr("disabled",true);
	            $("#흡연자").attr("checked", false);
	        }
	    }
    </script>
	
	
<!-- 에디터 삽입 -->
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">

<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">  
	<div class="regist-wrap" align="center">
	   <form action="regist" method="post" enctype="multipart/form-data">
	   <div id="align-left">
	    <h1>펫밀리 가입</h1>
	        <div id="step1">
	            <img src="${context}/resources/img/step.png" alt="step1">
	        </div>
	        <br><br>
	
	    <!-- 회원 아이디 -->
	        <input type="hidden" name="sitter_id" value="${id}">
	        
	        <!-- 펫시터 소개글 -->	
	        <div>
	            <table width="60%">
	                <tr>
	                    <td><label for="info-text" id="large-text">펫밀리 소개</label></td>
	                    
	                <tr>
	                    <td>
	                        <span id="medium-text">*본인에 대해 소개해 주세요</span>
	                        <span id="small-text">-본인 자랑 및 경험 환영</span>
	                    </td>
	                </tr>    
	                <tr>
	                    <td><hr></td>
	                </tr>
	                <tr>
	                    <td>
	                        <div class="naver-editor"></div>
	                        <input type="hidden" name="info" value="" id="info-text">
	                    </td>
	                </tr>
	            </table>
	        </div>
	
	        <br><br>
	        <!-- 스킬 -->
	        <div class="skill">
	            <label id="large-text">펫밀리 스킬</label><br>
	            <span id="medium-text">*스킬을 선택하지 않으시면, 예약을 받을 수 없습니다.</span>
	            <hr>
	            <c:forEach var="skillnames" items="${skillname}">
		            <input id="${skillnames.skill_name}" type="checkbox"  value="${skillnames.skill_no}" name="skills_name" data-skills="${skillnames.skill_name}">
		            <label for="${skillnames.skill_name}">${skillnames.skill_name}</label>
	            </c:forEach>   	        
		        <div id="skills_text"></div>
	        </div>
	
	        <br><br>
	        <!-- 돌봄 가능 동물 종류 -->
	        <div class="type">
	            <label id="large-text">펫밀리 돌봄가능 동물 종류</label><br>
	            <span id="medium-text">*돌봄가능 동물 종류를 선택하지 않으시면, 예약을 받을 수 없습니다.</span>
	            <hr>
	            <c:forEach var="carepettypes" items="${carepettype}">
	                <input id="${carepettypes.care_type}" type="checkbox"  value="${carepettypes.care_type_no}" name="care_name" data-animal="${carepettypes.care_type}">
	                <label for="${carepettypes.care_type}">${carepettypes.care_type}</label>
	            </c:forEach>        
	            <div id="care_pet_type_text"></div>
	        </div>
	
	        <br><br>
	        <!-- 돌봄 환경 -->
	        <div class="condition">
	            <label id="large-text">펫밀리 돌봄 환경</label><br>
	            <span id="medium-text">*돌봄 환경을 종류를 선택하지 않으시면, 예약을 받을 수 없습니다.</span>
	            <hr>
	            <c:forEach var="c" items="${careconname}">    		
	                <input id="${c.care_condition_name}" type="checkbox"  value="${c.care_condition_no}" name="care_condition_name" data-condition="${c.care_condition_name}">	     
	                <label for="${c.care_condition_name}">${c.care_condition_name}</label>
	            </c:forEach>        
	            <div id="care_condition_text"></div>
	        </div>
	
	        <br><br>
	        <!-- 통장 계좌 -->
	        <div>
	            <label for="bankName">
	                <span id="large-text">펫밀리 입금 은행 계좌</span><br>
	                <span id="medium-text">*은행 계좌 번호는 -제외한 숫자만 입력해주세요.</span>
	            </label><br>
	            <hr>
	
	                <select id="bankName" name="sitter_bankname"> 
	                    <option value="" selected disabled hidden>은행</option>
	                    <option>기업은행</option>
	                    <option>국민은행</option>
	                    <option>우리은행</option>
	                    <option>신한은행</option>
	                    <option>KEB하나은행</option>
	                    <option>농협은행</option>
	                    <option>SC제일은행</option>
	                    <option>한국씨티은행</option>
	                    <option>우체국</option>
	                    <option>경남은행</option>
	                    <option>광주은행</option>
	                    <option>대구은행</option>
	                    <option>산업은행</option>
	                    <option>새마을금고</option>
	                    <option>수협</option>
	                    <option>신협</option>
	                    <option>전북은행</option>
	                    <option>제주은행</option>
	                    <option>카카오뱅크</option>
	                    <option>케이뱅크</option>
	                </select>	
	                <input type="text" id="bank_account" name="sitter_bank_account" required placeholder="  계좌번호">	
	        </div>
	        
	        <br><br>
	        <!--반려동물 경험 -->
	        <div>
	            <label for="yn" id="large-text">펫밀리 동물 경험 여부</label><br>
	            <hr>
	            <select id="yn" name="sitter_pets">
	                <option value="" selected disabled hidden>동물 경험 여부</option>
	                <option>예</option>
	                <option>아니오</option>
	            </select>
	        </div>
	        
	        <br><br>
	        <!-- 매칭(돌봄) 종류 -->
	        <div>
	            <label for="mt" id="large-text">펫밀리 돌봄 가능한 종류</label><br>
	            <hr>
	            <select id="mt" name="sitter_matching_type">
	                <option value="" selected disabled hidden>돌봄 가능 종류</option>
	                <option>방문서비스</option>
	                <option>위탁서비스</option>
	                <option>둘다</option>
	            </select>
	        </div>
	        
	        <br><br>
	        <!-- 활동 지역 -->
	        <div class="location">
	            <label for="mt" id="large-text">펫밀리 활동 지역</label><br>
	            <hr>
	            <div class="template">
	                <select class="region" name="location_name[0].city" required>
	                    <option value="" selected disabled hidden>지역을 선택하세요</option>
	                </select>
	                
	                <select class="section" name="location_name[0].area" required>
	                    <option value="" selected disabled hidden>구를 선택하세요</option>
	                </select>
	            <button id="add-btn">추가</button>
	            </div>
	            <div id="result"></div>
	        </div>
	        <br>
	        
	        
	        <div class="file_input">
	        <!-- 소개 이미지 파일 -->	
	        <label for="info_image" id="large-text">펫밀리 소개 이미지</label><br>
	        <hr>      
	            <input type="file" id="info_image" name="info_image" multiple accept="image/*">
	        </div>
	        <br><br>
	        
	        <!-- 신분증 이미지 파일 -->	
	        <label for="id_card_file" id="large-text">펫밀리 신분증</label><br>
	        <hr>
	        <input type="file" id="id_card_file" name="id_card_file" multiple accept="image/*" required>
	        <br><br>
	        
	        <!-- 증빙서류 이미지 파일 -->	
	        <label for="license_file" id="large-text">펫밀리 증빙 서류</label><br>
	        <hr> 
	        <input type="file" id="license_file" name="license_file" multiple accept="image/*" required>
	        <br><br>
	
	        <!-- 통장 사본 이미지 파일 -->	
	        <label for="id_card_file" id="large-text">펫밀리 통장 사본 이미지</label><br>
	        <hr>
	        <input type="file" id="bank_image" name="bank_image" multiple accept="image/*" required>
	        <br><br> <br><br>
	    </div>
	
	
	        <div align="center">
	            <h5>다음 단계로 진행하면 펫밀리 신청 약관 에 동의하는 것으로 간주됩니다.</h5>
	            <input id="regist_btn" type="submit" value="펫밀리 가입">
	        </div>
	</form>
	</div>
</section>

	<br><br>
	<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    