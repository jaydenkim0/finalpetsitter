<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script>
	function prevent(){
	    var tag = document.querySelector(".password");
	    var text = tag.value;
	    var len = text.length;
	    if(len > 4){
	        text = text.substring(0, 4);
	        tag.value = text;
	    }
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
        //해야할일 : id에 input 이벤트가 발생하면 ajax로 xml을 불러와서 검사
        $(function(){
            $("input[name=care_sitter_id]").blur(function(){
                $.ajax({
                    url:"./id_check.xml",
                    dataType:"xml",
                    success:function(resp){
                        var result = false;
                        $(resp).find("id").each(function(){
                            if($(this).text() === $("input[name=id]").val()){
                                result = true;
                            }
                        });
                        if(!result){
                            $("input[name=id]").next().text("이미 사용중인 아이디입니다");
                        }
                    }
                });
            });
        });
    </script>
</head>

<body>
<h1>돌봄방 생성</h1>
<table border="1">
	<form action="write">
		<tr>
			<th>작성자 아이디</th>
			<td><input type="text" readonly value=${id } name="care_member_id"></td>
		</tr>
		<tr>
			<th>펫시터 아이디</th>
			<td>
				<input type="text" name="care_sitter_id" class="sitter_id_check">
				<span></span>
			</td>
		</tr>
		<tr>
			<th>방 제목</th>
			<td><input type="text" name="care_board_content"></td>
		</tr>
		<tr>
			<th>방 비밀번호</th>
			<td><input class="password" oninput="prevent();" type="number" name="care_pw" placeholder="4자리 숫자"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="생성">
			</th>
		</tr>
	</form>
</table>
</body>

