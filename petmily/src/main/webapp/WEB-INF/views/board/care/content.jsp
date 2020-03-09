<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
	
	

<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script>
	$(function(){

////////////////////////////////////////////////////////////////////////////////////////////////////
//		방 제목 수정
////////////////////////////////////////////////////////////////////////////////////////////////////
		//edit 클래스를 가진 요소를 숨김
        $(".content_edit").hide();

        //수정을 누르면 수정화면이 표시되도록 처리
        $(".content_view").find(".content_change").click(function(){
            //this == button
            $(this).parents(".content_view").hide();
            $(this).parents(".content_view").next(".content_edit").show();
        });

        //완료를 누르면 글자화면이 표시되도록 처리
        $(".content_submit").submit(function(e){
            //this == form
            e.preventDefault();//기본이벤트 방지

            //비동기통신을 이용하여 작성한 댓글을 수정페이지로 전달
            //[1] 보내는 주소를 어떻게 구할 것인가?
            // - form에 작성된 action을 불러올 수 있는가?
            // - form에 작성된 method를 불러올 수 있는가?
            //[2] 비동기통신으로 데이터를 어떻게 보내는가?
            var url = $(this).attr("action");
            var method = $(this).attr("method");

            var data = $(this).serialize();

            // console.log(url, method, data);
            $.ajax({
                url:url,
                type:method,
                data:data
            });

            $(this).parents(".content_edit").hide();
            $(this).parents(".content_edit").prev(".content_view").show();
	        window.location.reload();
        });
        
////////////////////////////////////////////////////////////////////////////////////////////////////
//		댓글 등록
////////////////////////////////////////////////////////////////////////////////////////////////////  
//         $(".reply_regist_btn").click(function(e){
//             e.preventDefault();

//             var url = $(this).attr("action");
//             var method = $(this).attr("method");

//             var data = $(this).serialize();

//             $.ajax({
//                 url:url,
//                 type:method,
//                 data:data
//             });
// 	        window.location.reload();
//         });
        
////////////////////////////////////////////////////////////////////////////////////////////////////
//		댓글 수정
//////////////////////////////////////////////////////////////////////////////////////////////////// 
        $(".reply_edit").hide();
        $(".reply_edit_btn").hide();

        $(".reply_view_btn").click(function(){
            $(this).hide();
            $(this).parentsUntil(".mother").find(".reply_view").hide();
            $(this).prev(".reply_edit_btn").show();
            $(this).parentsUntil(".mother").find(".reply_edit").show();
        });
        
        var textoriginal = $(this).parentsUntil(".mother").find(".content").val();
        $(this).parentsUntil(".mother").find("textarea").text(textoriginal);
        

        $(".reply_edit_btn").click(function(e){
        	var text = $(this).parentsUntil(".mother").find("textarea").val();
        	console.log(text);
        	
            e.preventDefault();

            var url = $(this).parentsUntil(".mother").find(".reply_change_submit").attr("action");
            var method = $(this).parentsUntil(".mother").find(".reply_change_submit").attr("method");
            var data = $(this).parentsUntil(".mother").find(".reply_change_submit").serialize();

            $.ajax({
                url:url,
                type:method,
                data:data
            });

            $(this).hide();
            $(this).parentsUntil(".mother").find(".reply_edit").hide();
            $(this).parentsUntil(".mother").find(".reply_view").show();
            $(this).parentsUntil(".mother").find(".reply_view_btn").show();
            $(this).parentsUntil(".mother").find(".content").text('');
            $(this).parentsUntil(".mother").find(".content").text(text);       
        });

        
////////////////////////////////////////////////////////////////////////////////////////////////////
//    		댓글 삭제
////////////////////////////////////////////////////////////////////////////////////////////////////         	
        $(".reply_delete_btn").click(function(e){
        	e.preventDefault();
        	
        	var url = $(this).parentsUntil(".mother").find(".reply_delete_submit").attr("action");
        	var method = $(this).parentsUntil("mother").find(".reply_delete_submit").attr("method");
        	var data = $(this).parentsUntil(".mother").find(".reply_delete_submit").serialize();
        	
        	$.ajax({
        		url:url,
        		type:method,
        		data:data
        	});
        	
        	$(this).parentsUntil(".grandmother").hide();
        });
	});
</script>

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
<script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>




<!-- 편집기 writer -->



<script
	src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
<!-- 네이버 토스트에디터 종료 -->

<script>
	$(function() {
		//생성은 항상 옵션 먼저 + 나중에 생성
		var options = {
			//대상
			el : document.querySelector(".naver-editor-top"),
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
									.querySelector(".naver-editor-top + input[target=content]").value = text;
						});
	});
</script>

<script>
	$(function() {
		
		document.querySelectorAll(".naver-editor").forEach(function(tag){
		//생성은 항상 옵션 먼저 + 나중에 생성
		var options = {
			el:tag,
			//미리보기 스타일(vertical / horizontal)
			previewStyle : "horizontal",
			//입력 스타일
			initialEditType : "wysiwyg",
			//높이
			height : "300px"
		};

		var editor = tui.Editor.factory(options);
		
		 var first = $(tag).next("input[target=_blank]").val();
         editor.setValue(first);//값 설정
         
		//에디터의 값이 변하면 뒤에 있는 input[type=hidden]의 값이 변경되도록 처리
		editor
				.on(
						"change",
						function() {
							var text = editor.getValue();//에디터에 입력된 값을 불러온다
							document
									.querySelector(".naver-editor + input[target=_blank]").value = text;
						});
		});
	});
</script>






<!-- 뷰어 -->


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
                var text = $(tag).next("input[name=reply_content]").val();
                viewer.setValue(text);//값 설정
        	});
        	
            
        });
    </script>
<!-- 네이버 에디터 영역 종료 --> 



<script>
function no_image1(){
	$("#1").attr("src", "/petmily/resources/img/기본프로필.jpeg");
}

function no_image2(){
	$("#2").attr("src", "/petmily/resources/img/기본프로필.jpeg");
	window.alert(document.getElementById(test.getAttribute('id')).getAttribute('id'));
}

function testfunc(test) {
	var errorid = document.getElementById(test.getAttribute('id')).getAttribute('id');
	var erroridreal = "#"+errorid;
// 	window.alert(erroridreal);
	document.querySelectorAll("'"+erroridreal+"'").forEach(function(tag){
		$(tag).attr("src", "/petmily/resources/img/기본프로필.jpeg");
	});
}
</script>
<style>
 *{
       box-sizing: border-box;
}
.page-navigator li {
	display: inline-block;
	font-size:22px;
}
.page-navigator li.active>a {
	color: #1482e0;
}
  .mother {
    width: 100%;
    border: 1px solid #444444;
  }
  
   textarea{
        width:100%;
        height:150px;
    }
.btn {
	display: white;
	width: 80px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size : 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}
.reply_regist_btn{
	height:50px;
	width:150px;
	font-size:20px;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}
.head{
	background-color: #1482e0;
	height: 50px;
}
.roomdelete{
	margin-right:80px;
}
.headcontent{
	font-size:29px;
	color: white;
	margin-top:30px;
}
.page-navigator{
padding:0;
}
	.section-content{
	padding-top:150px;
	}
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
	.replyregist{
/* 		 background-color: #e0e0e0; */
		 width:90%;
		 border-radius: 50px;
	}
	.writedate{
		 opacity: 0.8;
	}
	.grandmother{
		padding-right: 10%;
		padding-left:10%;
	}

</style>
</head>

<body>

<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<section class="section-content">
<!-- 방 정보 -->
<div align="center" width="90%" class="head">
	<div class="headcontent">
		<c:choose>
				<c:when test="${not empty list.care_member_id }">
					<td>${list.care_member_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			와(과)
			<c:choose>
				<c:when test="${not empty sitter_id }">
					<td>${sitter_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			의 대화
	</div>
</div>
<p align="center" class="writedate">생성일 ${list.writedateWithFormat }</p>
	<br>
	<div align="right">
		<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin'}">
		<a href="delete?care_board_no=${care_board_no }"><button class="btn hover3 roomdelete">방 삭제</button></a><br><br>
		</c:if>
	</div>
<!-- <table border="1" width="100%"> -->
<!-- 	<tr> -->
<!-- 		<th rowspan="2">생성자</th> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${not empty list.care_member_id }"> --%>
<%-- 					<td>${list.care_member_id }</td> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<td>탈퇴회원</td> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td> -->
<%-- 			<img src = "${pageContext.request.contextPath }/board/care/member/image?member_image_member_id=${list.care_member_id }" style="max-width: 15%; height: auto;" onerror="no_image1()" id="1"/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>펫시터</th> -->
<%-- 		<td>${sitter_id }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>방 제목</th> -->
<!-- 		<td class="content_view"> -->
<%-- 			${list.care_board_content } --%>
<%-- 			<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin'}"> --%>
<!-- 			<button class="content_change">변경</button> -->
<%-- 			</c:if> --%>
<!-- 		</td> -->
<!-- 		<td class="content_edit"> -->
<!--             <form class="content_submit" action="content_edit" method="get"> -->
<%--                 <input type="hidden" name="board_no" value="${list.care_board_no }"> --%>
<%--                 <input type="text" name="care_board_content" value="${list.care_board_content }"> --%>
<!--                 <input type="submit" value="완료"> -->
<!--              </form>			 -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>생성일</th> -->
<%-- 		<td>${list.writedateWithFormat }</td> --%>
<!-- 	</tr> -->
<!-- </table> -->



<!-- 댓글 목록 -->


<c:forEach var="replyimagelist" items="${replyimagelist }">
<div class="grandmother">
<table class="mother">
<c:choose>

<!-- 댓글 작성자와 session(id)값이 일치할 경우 -->
<c:when test="${replyimagelist.care_reply_writer==id && care_reply_writer!=null && id!=null}">
		<tr>
			<c:choose>
				<c:when test="${not empty replyimagelist.care_reply_writer }">
					<th align="left">
					<c:choose>
						<c:when test="${replyimagelist.member_image_no>0}">
							<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${replyimagelist.member_image_no}" style="max-width: 200px; height: 200px;">
						</c:when>
						<c:otherwise>
							<img src="/petmily/resources/img/기본프로필.jpeg" style="max-width: 200px; height: 200px;">
						</c:otherwise>
					</c:choose>
						<p>작성자 : ${replyimagelist.care_reply_writer }</p>
					</th>
				</c:when>
				<c:otherwise>
					<th>탈퇴회원</th>
				</c:otherwise>
			</c:choose>
			<th align="right">${replyimagelist.wdateWithFormat }</th>
		</tr>
		
		<!-- 댓글 수정전 보여주는 tr -->
		<tr class="reply_view">
			<th class="content" colspan="2" align="left">
				<div class="naver-viewer"></div>  
				<input type="hidden" name="reply_content" value="${replyimagelist.care_reply_content }">  
			</th>
		</tr>
		
		<!-- 댓글 수정중 보여주는 tr -->
		<tr class="reply_edit">
			<th colspan="2" align="left">
				<form action="reply_change" method="post" class="reply_change_submit">
					<input type="hidden" name="care_reply_no" value="${replyimagelist.care_reply_no }">
                	<div class="naver-editor"></div>
					<input type="hidden" name="care_reply_content" value="${replyimagelist.care_reply_content }" required class="change" target="_blank">
				</form>				
			</th>
		</tr>
		<c:if test="${replyimagelist.care_image_no>0 }">
			<tr>
				<th align="left">
					<img src = "${pageContext.request.contextPath }/board/care/image?care_image_no=${replyimagelist.care_image_no }" style="max-width: 40%; height: auto;">
				</th>
			</tr>
		</c:if>
		
		
		<!-- 댓글 관리 -->
		
		<c:if test="${(replyimagelist.care_reply_writer==id && id!=null) || grade=='admin'}">
		<tr>
			<th colspan="2" align="right">
				<button class="reply_edit_btn">완료</button>
				<button class="reply_view_btn">수정</button>
				<form action="reply_delete" method="post" class="reply_delete_submit">
					<input type="hidden" name="care_reply_no" value="${replyimagelist.care_reply_no }">
				</form>
				<button class="reply_delete_btn">삭제</button>
			</th>
		</tr>
		</c:if>
</c:when>

<!-- 댓글 작성자와 session(id)값이 일치하지 않거나 null인 경우 -->
<c:otherwise>
		<tr>
			<c:choose>
				<c:when test="${not empty replyimagelist.care_reply_writer }">
					<th align="left">
					<c:choose>
						<c:when test="${replyimagelist.member_image_no>0}">
							<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${replyimagelist.member_image_no}" style="max-width: 200px; height: 200px;">
						</c:when>
						<c:otherwise>
							<img src="/petmily/resources/img/기본프로필.jpeg" style="max-width: 200px; height: 200px;">
						</c:otherwise>
					</c:choose>
						<p>작성자 : ${replyimagelist.care_reply_writer }</p>
					</th>
				</c:when>
				<c:otherwise>
					<th>탈퇴회원</th>
				</c:otherwise>
			</c:choose>
			<th align="right">${replyimagelist.wdateWithFormat }</th>
		</tr>
		
		<!-- 댓글 수정전 보여주는 tr -->
		<tr class="reply_view">
			<th class="content" colspan="2" align="left">
				<div class="naver-viewer"></div>  
				<input type="hidden" name="reply_content" value="${replyimagelist.care_reply_content }">  
			</th>
		</tr>
		
		<!-- 댓글 수정중 보여주는 tr -->
		<tr class="reply_edit">
			<th colspan="2" align="left">
				<form action="reply_change" method="post" class="reply_change_submit">
					<input type="hidden" name="care_reply_no" value="${replyimagelist.care_reply_no }">
                	<div class="naver-editor"></div>
					<input type="hidden" name="care_reply_content" value="${replyimagelist.care_reply_content }" required class="change" target="_blank">
				</form>				
			</th>
		</tr>
		<c:if test="${replyimagelist.care_image_no>0 }">
			<tr>
				<th align="left">
					<img src = "${pageContext.request.contextPath }/board/care/image?care_image_no=${replyimagelist.care_image_no }" style="max-width: 40%; height: auto;">
				</th>
			</tr>
		</c:if>
		
		
		<!-- 댓글 관리 -->
		
		<c:if test="${(replyimagelist.care_reply_writer==id && id!=null) || grade=='admin'}">
		<tr>
			<th colspan="2" align="right">
				<button class="reply_edit_btn">완료</button>
				<button class="reply_view_btn">수정</button>
				<form action="reply_delete" method="post" class="reply_delete_submit">
					<input type="hidden" name="care_reply_no" value="${replyimagelist.care_reply_no }">
				</form>
				<button class="reply_delete_btn">삭제</button>
			</th>
		</tr>
		</c:if>
</c:otherwise>



</c:choose>
	</table>
</div>
</c:forEach>


<br>
<div align="center">
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/WEB-INF/views/board/care/navigator_content.jsp">
		<jsp:param name="pno" value="${pno}"/>
		<jsp:param name="count" value="${count}"/>
		<jsp:param name="navsize" value="${navsize}"/>
		<jsp:param name="pagesize" value="${pagesize}"/>
		<jsp:param name="care_board_no" value="${care_board_no }"/>
	</jsp:include>
</div>
<br>

<!-- 댓글 등록 -->
<div align="center">
<div class="replyregist">
<br><br>
<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin' || sitter_id==id}">
	<form action="reply_regist" method="post" class="reply_submit" enctype="multipart/form-data">
		<table width="100%" align="center">
			<tr>
				<td>
					<input type="file" name="care_image" accept="image/*">
					<br><br>
				</td>
				<td align="right">
					<input type="submit" value="보내기" class="reply_regist_btn btn hover3">
					<br><br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="care_reply_board_no" value="${list.care_board_no }">
					<input type="hidden" name="care_reply_writer" value="${id }">
					<div class="naver-editor-top"></div>
					<input type="hidden" name="care_reply_content" value="" target="content">
				</td>
			</tr>
		</table>
	</form>
</c:if>
<br><br>
</div>
</div>
<br><br><br><br>
</section>
   <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
