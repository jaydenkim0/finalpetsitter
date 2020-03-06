<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 

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
* {
	box-sizing: border-box;
}

.notice_table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: #BDBDBD;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.tr1 {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: left;
	border-color: #BDBDBD;
}

.td2 {
	text-align: right;
	border-bottom: 1px solid #444444;
	padding: 10px;
	border-color: #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
	margin-left: auto;
	margin-right: auto;
}

hr {
	width: 80%;
}

.no_inputline {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	width:100px;
	text-align: left;
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

textarea {
	width: 1250px;
	height: 50px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
	margin: 0px; 
	vertical-align: middle;
}
.con{
height: 400px;
}

<!--
header style -->#masthead:after {
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
	padding-top: 150px;
}
</style>

<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="section-content">

	<h2 align="center">QnA</h2>
		<table class="notice_table">
			<!--qnaVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>No : ${qnaVO.qna_no}</td>
			</tr>

			<tr>
				<td>Date : ${qnaVO.writedateWithFormat}</td>
			</tr>

			<tr>
				<td>Name : ${qnaVO.qna_writer}</td>
			</tr>

			<tr>
				<td>말머리 : ${qnaVO.qna_title}</td>
			</tr>

			<tr class="tr1">
				<td>Subject : 
				<font color="#1482e0">[${qnaVO.qna_title}]</font>
				${qnaVO.qna_head}</td>
			</tr>

		<tr class="tr1">
			<c:forEach var="qnaImage" items="${qnaImageList}">
				<c:if test="${qnafileDto.qna_file_no ne 0}">
					<tr>
						<td class="td1"><img
							src="${context}/board/qna/view/file_view?qna_file_no=${qnaImage.qna_file_no}"
							width="200" height="100"></td>
					</tr>
				</c:if>
			</c:forEach>
		
		<tr class="tr1">
			<td><c:choose>
					<c:when test="${qnaVO.qna_title eq '신고합니다'}">
						<c:if test="${sessionScope.id eq qnaVO.qna_writer || grade eq 'admin'}">
							<div class="con">
							<div class="naver-viewer"></div>
							<input type="hidden" name="faq_content" value="${qnaVO.qna_content}">
						</div>
						</c:if>
<!-- 						<div class="con"> -->
<!-- 							<div class="naver-viewer"></div> -->
<!-- 							<input type="hidden" name="qna_content" value="게시글 권한이 없습니다."> -->
<!-- 						</div> -->
					</c:when>
					<c:otherwise>
						<div class="con">
							<div class="naver-viewer"></div>
							<input type="hidden" name="qna_content" value="게시글 권한이 없습니다.">
						</div>
<!-- 						<div class="naver-viewer"></div> -->
<!-- 						<input type="hidden" name="qna_content" -->
<%-- 							value="${qnaVO.qna_content}"> --%>
					</c:otherwise>
				</c:choose></td>
		</tr>

<!-- 댓글화면 -->

<c:forEach items="${replyList}" var="reply">
<c:if test="${reply.content ne null}">
<tr class="tr1">
	<td>
	<div class="grandmother">
		<table width="100%" class="mother">
			<tr>
				<th align="left"> 
				<img src = "${context}/board/qna/member/image?member_image_member_id=${reply.reply_writer}" style="max-width: 15%; height: auto;"  onerror="no_image2()" id="2">${reply.reply_writer}
				<c:if test="${qnaVO.qna_writer == reply.reply_writer}">
					<font color="red">(작성자)</font>
				</c:if>
				<br>
				<font size="1px">작성일 : ${reply.writedateWithFormat}</font></th>
			</tr>
			
			<tr class="reply_view">
				<c:choose>
					<c:when test="${qnaVO.qna_title eq '신고합니다'}">
						<c:if test="${sessionScope.id eq qnaVO.qna_writer || grade eq 'admin'}">
							<th class="content" colspan="2" align="left">${reply.content}</th>
						</c:if>
<!-- 						<th class="content" colspan="2" align="left">댓글을 볼 수 있는 권한이 없습니다.</th> -->
					</c:when>
				<c:otherwise>
<%-- 				<th class="content" colspan="2" align="left">${reply.content}</th>  --%>
	<th class="content" colspan="2" align="left">댓글을 볼 수 있는 권한이 없습니다.</th>
				</c:otherwise>
		</c:choose>
			</tr>
		
		<!-- 댓글 수정 -->	
			<tr class="reply_edit">
				<td align="right">
				<th colspan="2" align="left">
					<form action="replyUpdate" method="post"
						class="reply_change_submit">
						<input type="hidden" name="reply_no" value="${reply.reply_no}">
						<input type="hidden" name="origin" value="${reply.origin}">
						<textarea name="content" required class="val">${reply.content}</textarea>
					</form>
				</th>

			<c:if test="${sessionScope.id eq reply.reply_writer || grade eq 'admin'}">
				<tr>
					<th colspan="2" align="right">
						<button class="reply_view_btn">수정</button>
						<button class="reply_edit_btn">완료</button> 
						<a href="replyDelete?reply_no=${reply.reply_no}&origin=${qnaVO.qna_no}">
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
<td align="right">
	<c:choose>
		<c:when test="${qnaVO.qna_title eq '신고합니다'}">
			<c:if test="${sessionScope.id eq qnaVO.qna_writer || grade eq 'admin'}">
	<form action="replywrite" method="post" class="reply_submit">
		<input type="hidden" id="origin" name="origin" value="${qnaVO.qna_no}"><br> 
			<div align="left">
			<img src="${context}/resources/img/board.png" width="100px" height="80px" align="left">
			<br>
				<textarea align="left"  name="content" required placeholder="내용 입력" rows="4" cols="150" ></textarea>
				 <input type="submit" value="등록" class="btn hover3">
				<br><br>
			<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly class="no_inputline"></div>
		</form>
			</c:if>
<!-- 				<textarea align="left"  name="content" required placeholder="작성 권한이 없습니다." rows="4" cols="150" ></textarea> -->
				</c:when>
					<c:otherwise>
				<div align="left">
					<img src="${context}/resources/img/board.png" width="100px" height="80px" align="left">
				<br>
				<textarea align="left"  name="content"  readonly placeholder="작성 권한이 없습니다." rows="4" cols="150" ></textarea>
			 <input type="submit" value="등록" class="btn hover3">
					<br><br>
			<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly class="no_inputline"></div>
<!-- 			<form action="replywrite" method="post" class="reply_submit"> -->
<%-- 		<input type="hidden" id="origin" name="origin" value="${qnaVO.qna_no}"><br>  --%>
<!-- 				<div align="left"> -->
<%-- 					<img src="${context}/resources/img/board.png" width="100px" height="80px" align="left"> --%>
<!-- 				<br> -->
<!-- 				<textarea name="content" required placeholder="내용 입력" rows="4" cols="150" ></textarea> -->
<!-- 			 <input type="submit" value="등록" class="btn hover3"> -->
<!-- 					<br><br> -->
<%-- 			<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly class="no_inputline"></div> --%>
<!-- 		</form> -->
					<br>
				</c:otherwise>
		</c:choose>
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
					<select name="grade" required>
						<option value="" selected disabled hidden>선택하세요</option>
						<option value="petsitter"> 펫시터 </option>			
						<option value="member"> 회원 </option>
					</select>
					<input id="id" type="text"  name="id" placeholder="아이디" required> 
					<input  id="bbb"  type="submit" value="경고 등록" disabled>
				</form>
				<div id="id_check"></div>
			</c:if>
			
		</td>
	</tr>
</table>
</section>
<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
 