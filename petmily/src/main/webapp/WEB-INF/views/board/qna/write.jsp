<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 에디터 불러오기 -->
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<style>
    textarea[name=faq_content]{
        width:100%;
        height:150px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<!-- languages (Basic Language: English/en) -->
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
    function loadEditor(){
        var editor = SUNEDITOR.create((document.querySelector('textarea[name=qna_content]')),{
            //언어 설정
            lang: SUNEDITOR_LANG['ko'],
            
            //버튼 목록
            buttonList:[
            	 ['font','fontSize','fontColor'],
                 ['underline','italic', 'bold','paragraphStyle','formatBlock'],
                 ['align','table']

              ],
              font:[
                 '굴림','궁서','binggrae','Verdana','Arial'
             ],
             fontSize:[
             '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '26', '28', '36', '48', '72'
             ],
             fontColor:[
          ],
        });
        
    	//중요 : 키입력시마다 값을 원래위치(textarea)에 복사
	    editor.onKeyUp = function(e){
	    	var qna_content = document.querySelector("textarea[name=qna_content]");
	    	qna_content.value = editor.getContents();
	    }
    }
    
    //윈도우 로딩 시 loadEditor를 실행하도록 설정(body에 onload 한 효과)
    window.onload = loadEditor;
</script>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<div align="center">

<h2>문의글 작성</h2>
<form method="post" action="insert" enctype="multipart/form-data">
	<input type="hidden" name="qna_writer" value="${sessionScope.id}">
		<table border="1" width="70%">
		<<tr>
			<th>말머리<th>
			<td>
			<select name="qna_title">
				<option>펫시터 질문</option>
				<option>유저 질문</option>
				<option>기타 질문</option>
				<option>신고합니다</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
		<input name="qna_head" id="qna_head" size="80"
				placeholder="글 제목 입력">
			</td>
	</tr>
		<tr>
		<td colspan="2">
			<textarea name="qna_content" id="qna_content" required rows="15" cols="100" 
			style="resize:vertical;" placeholder="글 내용 입력" ></textarea>
		</td>
	</tr>
	<tr>
	<th>이미지 첨부</th>
	<td><input type="file" id="qna_file" name="qna_file" multiple accept="image/*" required></td>
		<td colspan="2" align="center">
			<input type="submit" value="확인"> 
			<input type="reset" value="초기화">
		</td>
	</table>
</form>
</div>