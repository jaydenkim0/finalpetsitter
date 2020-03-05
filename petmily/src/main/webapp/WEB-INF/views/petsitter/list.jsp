<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

	<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 
기본 CSS
:	font css
-->
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
	
	.section001{
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



<!-- 에디터와 동일한 의존성 라이브러리 설정을 한다 -->
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
 
 <!-- 네이버 에디터 영역 -->
   <script>        
        $(function(){
        	//document.querySelectorAll은 우측 선택자에 해당하는 모든 태그를 다 불러옴
        	//.forEach는 불러온 대상을 iteration 하는 반복 명령(한개씩 다시 불러와서 tag이라고 부름)
        	document.querySelectorAll(".naver-viewer").forEach(function(tag){
        		var options = {
					//el(element) : 에디터가 될 영역
					el:tag,
                       
                    viewer:true,

                     //height : 생성될 에디터의 높이
                     height:'auto',
				};

				var viewer = tui.Editor.factory(options);

				//생성된 뷰어에 초기값 표시
                var text = $(tag).next("input[type=hidden]").val();
                viewer.setValue(text);//값 설정
        	});
        	
            
        });
    </script>
<!-- 네이버 에디터 영역 종료 -->  
  
   <script>
   function list(page){
	   if("${cityKeyword}" === "" && "${areaKeyword}" === ""){
			location.href="${pageContext.request.contextPath}/petsitter/list?curPage="+page;
		}else{
			location.href="${pageContext.request.contextPath}/petsitter/list?curPage="+page+"&cityKeyword=${city}"+"&areaKeyword=${area}";			
		}
	}
   </script>
 
	<script>
	 $(function(){
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
	}); 
    </script>
	
	
	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
	<section class="section-content">
	<h1>펫시터 정보 조회</h1>
	<!-- 기존 지역으로 검색  -->
		<form method="post" action="${pageContext.request.contextPath}/petsitter/list">
			 <div class="location">
			    <div class="template">
			        <select class="region" name="cityKeyword">
			            <option>지역을 선택하세요</option>			          
			        </select>
			        
			        <select class="section" name="areaKeyword">
			            <option>구를 선택하세요</option>
			        </select>
			
			    	<input type="submit" value="검색">
			    </div>
			    <div id="result"></div>
			</div>
		</form>	
		
	<!-- 아이디 닉네임으로 검색 -->				
		<form method="post" action="${pageContext.request.contextPath}/petsitter/searchlist">
			<select name="searchOption">
				<option value="nick">닉네임</option>
				<option value="sitter_id">펫시터아이디</option>
			</select>
			<input type="text" name="keyword" placeholder="검색명을 입력해주세요">
			<input type="submit" value="검색">		
		</form>
	
		<h4>${count}개의 게시물이 있습니다.</h4>
	
		<c:forEach var="petsitter" items="${list}">					
			<!-- 펫시터 정보 -->			
					<c:if test="${petsitter.member_image_no > 0}">
						<img src="${pageContext.request.contextPath}/petsitter/member/image?member_image_no=${petsitter.member_image_no}" style="width: 20%; height: auto;" onerror="no_image2()" id="member_image"><br>
					</c:if>	
						<a href="content?pet_sitter_no=${petsitter.pet_sitter_no}">
						<span>닉네임 : ${petsitter.nick}</span></a>
						<br>
					<div class="naver-viewer"></div> 
					<input type="hidden" value="${petsitter.info}"><br>
					<c:forEach var="location" items="${petsitter.list}">
						<span>지역 : ${location.city} ${location.area}</span><br>
					</c:forEach>
					<hr>
		</c:forEach>
	
		<!-- 페이징 -->
		<table>
			<tr>
				<td colspan="5">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
					<c:if test="${navi.curBlock > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curBlock > 1}">
						<a href="javascript:list('${navi.prevPage}')">[이전]</a>
					</c:if>
					
					<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
					<c:forEach var="num" begin="${navi.blockBegin}" end="${navi.blockEnd}">
						<!-- 현재페이지이면 하이퍼링크 제거 -->
						<c:choose>
							<c:when test="${num == navi.curPage}">
								<span style="color: red">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curBlock <= navi.totBlock}">
						<a href="javascript:list('${navi.nextPage}')">[다음]</a>
					</c:if>
					
					<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curPage <= navi.totPage}">
						<a href="javascript:list('${navi.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</section><br>
	
	
		 <!-- footer 불러오기 -->
         <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>      