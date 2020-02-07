<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
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
	<tr class="content_view">
		<th>방 제목</th>
		<td>
			${list.care_board_content }
			<button class="content_change">변경</button>
		</td>
	</tr>
	 <tr class="content_edit">
	 		<th>방 제목</th>
                <td>
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

</body>
