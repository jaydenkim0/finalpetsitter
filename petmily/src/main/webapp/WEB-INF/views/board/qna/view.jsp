<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 

<!-- css -->
  <link rel="stylesheet" href="${context}/resources/css/view.css">
 

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
 	
 	<script type="text/javascript">
	/*  관리자 신고 아이디 검사 */
	$(function(){			
		$("#id").blur(function(){
			var user_id = $("#id").val();				
				$.ajax({
					url:'${pageContext.request.contextPath}/member/idCheck?userId='+user_id,
					type:'get',
					success : function(data){
						if(data == 0) {
							$("#id_check").text("존재하지 않는 아이디입니다");
							$('#id_check').css('color', 'red');
						}else{
							$("#id_check").text("신고가능한 아이디입니다");
							$('#id_check').css('color', 'red');
							$("#bbb").attr("disabled", false);
						}
 					}
 				});   
			});    
	  });
	</script>
	
	<script type="text/javascript">
	/*  관리자 신고 아이디 검사 */
	$(function(){			
		$("#id").blur(function(){
			var user_id = $("#id").val();				
				$.ajax({
					url:'${pageContext.request.contextPath}/member/idCheck?userId='+user_id,
					type:'get',
					success : function(data){
						if(data == 0) {
							$("#id_check").text("존재하지 않는 아이디입니다");
							$('#id_check').css('color', 'red');
						}else{
							$("#id_check").text("신고가능한 아이디입니다");
							$('#id_check').css('color', 'red');
							$("#bbb").attr("disabled", false);
						}
 					}
 				});   
			});    
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
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-viewer"),
                
                viewer:true,

                //height : 생성될 에디터의 높이
                height:'auto',
            };

            var viewer = tui.Editor.factory(options);

            //생성된 뷰어에 초기값 표시
            console.log(document.querySelector(".naver-viewer + input[type=hidden]"));
            var text = document.querySelector(".naver-viewer + input[type=hidden]").value;
            viewer.setValue(text);//값 설정
        });
    </script>
    

	<!-- 댓글 작성 영역 -->
	<script>
		// 댓글 작성
		$(function() {
			$(".reply_submit").submit(function(e) {
				e.preventDefault();
	
				var url = $(this).attr("action");
				var method = $(this).attr("method");
	
				var data = $(this).serialize();
	
				$.ajax({
					url : url,
					type : method,
					data : data,
					success : function(resp) {
					}
				});
				window.location.reload();
			});
			//댓글 삭제
			$(".replyDelete_btn").click(
					function(e) {
						e.preventDefault();
	
						var url = $(this).parentsUntil(".mother").find(
								".replyDelete_submit").attr("action");
						var method = $(this).parentsUntil("mother").find(
								".replyDelete_submit").attr("method");
						var data = $(this).parentsUntil(".mother").find(
								".replyDelete_submit").serialize();
	
						$.ajax({
							url : url,
							type : method,
							data : data
						});
	
						$(this).parentsUntil(".grandmother").hide();
					});
	
			// 댓글 수정
			$(".reply_edit").hide();
			$(".reply_edit_btn").hide();
	
			$(".reply_view_btn").click(function() {
				$(this).hide();
				$(this).parentsUntil(".mother").find(".reply_view").hide();
				$(this).next(".reply_edit_btn").show();
				$(this).parentsUntil(".mother").find(".reply_edit").show();
			});
	
			var textoriginal = $(this).parentsUntil(".mother").find(".content")
					.val();
			$(this).parentsUntil(".mother").find("textarea").text(textoriginal);
	
			$(".reply_edit_btn")
					.click(
							function(e) {
								var text = $(this).parentsUntil(".mother").find(
										"textarea").val();
	
								e.preventDefault();
	
								var url = $(this).parentsUntil(".mother").find(
										".reply_change_submit").attr("action");
								var method = $(this).parentsUntil(".mother").find(
										".reply_change_submit").attr("method");
								var data = $(this).parentsUntil(".mother").find(
										".reply_change_submit").serialize();
								console.log(url, method, data);
	
								$.ajax({
									url : url,
									type : method,
									data : data
								});
	
								$(this).hide();
								$(this).parentsUntil(".mother").find(".reply_edit")
										.hide();
								$(this).parentsUntil(".mother").find(".reply_view")
										.show();
								$(this).parentsUntil(".mother").find(
										".reply_view_btn").show();
								$(this).parentsUntil(".mother").find(".content")
										.text('');
								$(this).parentsUntil(".mother").find(".content")
										.text(text);
							});
		});
	</script>




<style>
textarea {
	width: 90%;
	height: 50px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1px #1482e0;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
	margin: 0px; 
	vertical-align: middle;
}
.ta{
	padding-top:70px;
}
.btn {
	display: white;
	width: 120px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size: 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}
<!--
header style -->
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

#masthead.is-active {
	background-color: #fff;
}

.section-content {
	padding-top: 115px;
}
	#masthead:after{
	opacity: 100;
}
.title{
	font-size: 50px;
	}
</style>

	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<section class="section-content">
<div align="center">
	<section class="ta">
	<h1 align="center" class="title">Question</h1>
		<table class="notice_table">
			<!--qnaVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>No :${qnaVO.qna_no}</td>
			</tr>

			<tr>
				<td>Date : ${qnaVO.writedateWithFormat}</td>
			</tr>

			<tr>
				<td>Name : ${qnaVO.qna_writer}</td>
			</tr>

			<tr class="tr1">
				<td>Subject : <font color="#1482e0">[${qnaVO.qna_title}]</font>
				${qnaVO.qna_head}</td>
			</tr>

		<tr class="tr1">
			<c:forEach var="qnaImage" items="${qnaImageList}">
				<c:if test="${qnafileDto.qna_file_no ne 0}">
					<tr>
						<td class="td1">
						<br>
						<img src="${context}/board/qna/view/file_view?qna_file_no=${qnaImage.qna_file_no}"
							width="200" height="100"></td>
					</tr>
				</c:if>
			</c:forEach>


			
		<tr class="tr1"><td>
				<div class="con">
					<div class="naver-viewer"></div>
					<input type="hidden" name="qna_content" value="${qnaVO.qna_content}">
				</div>
			</td>
		</tr>




			<!-- 댓글화면 -->
			<c:forEach items="${replyList}" var="reply">
				<c:if test="${reply.content ne null}">
					<tr class="no-tr">
						<td>
							<div class="grandmother">
								<table width="100%" class="mother">
									<tr>
										<th align="left">
											<img src = "${context}/board/stray/member/image?member_image_member_id=${reply.reply_writer}" style="max-width: 15%; height: auto;"  onerror="no_image2()" id="2">
										${reply.reply_writer}
										<c:if test="${qnaVO.qna_writer == reply.reply_writer}">
											<font color="red">(작성자)</font>
										</c:if>
											<font size="1px">작성일 : ${reply.writedateWithFormat}</font></th>
									</tr>

									<tr class="reply_view">
										<br>
										<th class="content" colspan="2" align="left">${reply.content}</th>
									</tr>

									<tr class="reply_edit">
										<td align="right">
										<th colspan="2" align="left">
											<form action="replyUpdate" method="post"
												class="reply_change_submit">
												<input type="hidden" name="reply_no"
													value="${reply.reply_no}"> <input type="hidden"
													name="origin" value="${reply.origin}">
												<textarea name="content" required class="val">${reply.content}</textarea>
											</form>
										</th>

										<!-- 댓글 수정 -->
										<c:if
											test="${sessionScope.id eq reply.reply_writer || grade eq 'admin'}">
											<tr>
												<th colspan="2" align="right">
													<button class="reply_view_btn">수정</button>
													<button class="reply_edit_btn">완료</button> <a
													href="replyDelete?reply_no=${reply.reply_no}&origin=${qnaVO.qna_no}">
														<button class="replyDelete_submit">삭제</button>
												</a>
												</th>
											</tr>
										</c:if>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>

			<!-- 댓글 등록 -->
		<tr>
	<td align="right" class="td3">
	<form action="replywrite" method="post" class="reply_submit">
		<input type="hidden" id="origin" name="origin" value="${qnaVO.qna_no}"><br> 
		<input class="no_inputline" type="hidden" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly>
		<textarea name="content" required placeholder="내용 입력" rows="4" cols="80" ></textarea>
		<input type="submit" value="등록" class="btn hover3">
		</form>
		</td>
	</tr>

	<tr>
	<td class="td2">
	<c:if test="${sessionScope.id eq qnaVO.qna_writer || grade eq 'admin'}">
		<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">
		<a href="${context}/board/qna/update?qna_no=${qnaVO.qna_no}">
		<button type="button" id="btnupdate" class="btn hover3">게시글 수정</button></a>
		<a href="${context}/board/qna/delete?qna_no=${qnaVO.qna_no}">
		<button type="button" id="btndelete" class="btn hover3">게시글 삭제</button></a>
	</c:if>
	
	<a href="${context}/board/qna/list">
	<button type="button" class="btn hover3">문의게시판 목록</button></a>
	<a href ="${context}/board/qna/write?superno=${qnaVO.qna_no}">
	<button type="button" class="btn hover3">답글쓰기</button></a>
	
	<!-- 신고 버튼 -->
			<c:if test="${sessionScope.grade eq 'admin'}">
				<br><br>
				<p style="color: red;">※ 회원 및 펫시터 신고는 신중히 진행하시길 바랍니다</p>			
				<form action="${context}/admin/declaration" method="get">
					<input id="id" type="text"  name="id" placeholder="아이디" required> 
					<input  id="bbb"  type="submit" value="경고 등록" disabled class="btn hover3">
				</form>
				<div id="id_check"></div>
			</c:if>
			

		</td>
	</tr>
</table>
</section>
</div>
</section>
<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
	