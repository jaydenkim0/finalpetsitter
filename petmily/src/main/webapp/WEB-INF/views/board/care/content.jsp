<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<style>
  .mother {
    width: 100%;
    border: 1px solid #444444;
  }
  
  textarea{
 	 width: 99%;
  }
</style>
</head>

<body>

<h1>돌봄 방 ${care_board_no }</h1><br>


<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin'}">
<a href="delete?care_board_no=${care_board_no }"><button>방 삭제</button></a><br><br>
</c:if>


<!-- 방 정보 -->

<table border="1" width="100%">
	<tr>
		<th>방번호</th>
		<td>${list.care_board_no }</td>
	</tr>
	<tr>
		<th>생성자</th>
			<c:choose>
				<c:when test="${not empty list.care_member_id }">
					<td>${list.care_member_id }</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
	</tr>
	<tr>
		<th>펫시터</th>
		<td>${sitter_id }</td>
	</tr>
	<tr>
		<th>방 제목</th>
		<td class="content_view">
			${list.care_board_content }
			<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin'}">
			<button class="content_change">변경</button>
			</c:if>
		</td>
		<td class="content_edit">
            <form class="content_submit" action="content_edit" method="get">
                <input type="hidden" name="board_no" value="${list.care_board_no }">
                <input type="text" name="care_board_content" value="${list.care_board_content }">
                <input type="submit" value="완료">
             </form>			
		</td>
	</tr>
	<tr>
		<th>생성일</th>
		<td>${list.writedateWithFormat }</td>
	</tr>
</table>


<!-- 댓글 등록 -->

<c:if test="${(list.care_member_id==id && id!=null) || grade=='admin' || sitter_id==id}">
	<form action="reply_regist" method="post" class="reply_submit" enctype="multipart/form-data">
		<table border="1" width="100%">
			<tr>
				<td>
					<input type="hidden" name="care_reply_board_no" value="${list.care_board_no }">
					<input type="hidden" name="care_reply_writer" value="${id }">
					<textarea name="care_reply_content" required></textarea>
					<input type="file" name="care_image" multiple accept="image/*">
				</td>
				<td align="right">
					<input type="submit" value="등록" class="reply_regist_btn">
				</td>
			</tr>
		</table>
	</form>
</c:if>

<!-- 댓글 목록 -->



<c:forEach var="replyimagelist" items="${replyimagelist }">
<div class="grandmother">
	<table width="100%" class="mother">
		<tr>
			<c:choose>
				<c:when test="${not empty replyimagelist.care_reply_writer }">
					<th align="left">작성자 : ${replyimagelist.care_reply_writer }</th>
				</c:when>
				<c:otherwise>
					<td>탈퇴회원</td>
				</c:otherwise>
			</c:choose>
			<th align="right">${replyimagelist.wdateWithFormat }</th>
		</tr>
		<tr class="reply_view">
			<th class="content" colspan="2" align="left">${replyimagelist.care_reply_content }</th>
		</tr>
		<tr class="reply_edit">
			<th colspan="2" align="left">
				<form action="reply_change" method="post" class="reply_change_submit">
					<input type="hidden" name="care_reply_no" value="${replyimagelist.care_reply_no }">
                	<textarea name="care_reply_content" required class="val">${replyimagelist.care_reply_content }</textarea>
				</form>				
			</th>
		</tr>
		<tr>
			<th align="left">
					<c:if test="${replyimagelist.care_image_no>0 }">
						<img src = "${pageContext.request.contextPath }/board/care/image?care_image_no=${replyimagelist.care_image_no }" style="max-width: 40%; height: auto;">
					</c:if>
			</th>
		</tr>
		
		
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
		
		
	</table>
	<div class="row" >
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/WEB-INF/views/board/faq/navigator.jsp">
			<jsp:param name="pno" value="${pno}"/>
			<jsp:param name="count" value="${count}"/>
			<jsp:param name="navsize" value="${navsize}"/>
			<jsp:param name="pagesize" value="${pagesize}"/>
		</jsp:include>
	</div>
</div>
</c:forEach>

</body>
