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
                data:data,
                success:function(resp){
                    console.log("성공");
                    //resp에 들어온 정보를 토대로 화면을 갱신
                }
            });

            $(this).parents(".content_edit").hide();
            $(this).parents(".content_edit").prev(".content_view").show();
	        window.location.reload();
        });
        
////////////////////////////////////////////////////////////////////////////////////////////////////
//		댓글 등록
////////////////////////////////////////////////////////////////////////////////////////////////////  
        $(".reply_submit").submit(function(e){
            e.preventDefault();

            var url = $(this).attr("action");
            var method = $(this).attr("method");

            var data = $(this).serialize();

            $.ajax({
                url:url,
                type:method,
                data:data,
                success:function(resp){
                }
            });
	        window.location.reload();
        });
        
////////////////////////////////////////////////////////////////////////////////////////////////////
//		댓글 수정
//////////////////////////////////////////////////////////////////////////////////////////////////// 
        $(".reply_edit").hide();

        $(".reply_change").click(function(){
            $(this).parent(".reply_view").hide();
            $(this).prev(".reply_edit").show();
            $(this).parent(".reply_edit").show();
        });
        
        var text = $(this).parent(".reply_edit").children(".val").val();

        $(".reply_change_submit").submit(function(e){
            e.preventDefault();

            var url = $(this).attr("action");
            var method = $(this).attr("method");

            var data = $(this).serialize();

            $.ajax({
                url:url,
                type:method,
                data:data
            });

            $(".reply_edit").hide();
            $(".content").innerText="";
            $(".content").innerText=text;
            $(".reply_view").show();            
        });
	});
</script>
</head>

<body>

<h1>돌봄 방 ${care_board_no }</h1><br>
<a href="delete?care_board_no=${care_board_no }"><button>방 삭제</button></a><br><br>
<table border="1" width="100%">
	<tr>
		<th>방번호</th>
		<td>${list.care_board_no }</td>
	</tr>
	<tr>
		<th>생성자</th>
		<td>${list.care_member_id }</td>
	</tr>
	<tr>
		<th>펫시터</th>
		<td>${sitter_id }</td>
	</tr>
	<tr>
		<th>방 제목</th>
		<td class="content_view">
			${list.care_board_content }
			<button class="content_change">변경</button>
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
		<td>${list.wdate.substring(0,16) }</td>
	</tr>
</table>
<table border="1" width="100%">
	<tr>
		<form action="reply_regist" method="post" class="reply_submit">
			<td>
				<input type="hidden" name="care_reply_board_no" value="${list.care_board_no }">
				<input type="hidden" name="care_reply_writer" value="${id }">
				<textarea name="care_reply_content" required></textarea>
			</td>
			<td align="right">
				<input type="submit" value="등록">
			</td>
		</form>
	</tr>
</table>
<c:forEach var="replylist" items="${replylist }">
	<table border="1" width="100%">
		<tr>
			<th>작성자 : ${replylist.care_reply_writer }</th>
			<th align="right">${replylist.wdate }</th>
		</tr>
		<tr class="reply_view">
			<th class="content">${replylist.care_reply_content }</th>
		</tr>
		<tr class="reply_edit">
			<th>
				<form action="reply_change" method="post" class="reply_change_submit">
				<input type="hidden" name="care_reply_no" value="${replylist.care_reply_no }">
                <textarea name="care_reply_content" required class="val">${replylist.care_reply_content }</textarea>
                <input type="submit" value="완료">
			</th>
		</tr>
		<tr>
			<th>
				<input type="submit" value="완료" class="reply_edit reply_change_submit">
				</form>				
				<button class="reply_view reply_change">수정</button>
				<button>삭제</button>
			</th>
		</tr>
	</table>
</c:forEach>

</body>
