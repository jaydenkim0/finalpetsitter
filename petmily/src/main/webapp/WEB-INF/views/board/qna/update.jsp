<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

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

<div align="center">
<form name="update" method="post" action="${context}/board/qna/update">
	<input type="hidden" name="member_id" value="${sessionScope.id}">
	<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">
	<table border="1" width="90%">
	<tr>
		<th>글 번호</th>
		<td>${qnaVO.qna_no}</td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td>${qnaVO.qna_writer}</td>
	</tr>
	
	<tr>
		<th>작성일자</th>
		<td>${faqVO.writedateWithFormat}</td>
	</tr>

	<tr>
		<th>말머리</th>
	<td>
		<select name="qna_title" value="${qnaVO.qna_title}">
			<option>펫시터 질문</option>
			<option>유저 질문</option>
			<option>기타 질문</option>
		</select>
	</td>
	</tr>

	<tr>
	<th>제목 :</th>
	<td>
		<input name="qna_head" value="${qnaVO.qna_head}" type="text">
	</td>
	</tr>

	<tr>
	<th>내용 :</th>
	<td colspan="2">
		<textarea name="qna_content"  id="qna_content" required rows="15" cols="100"  type="text">${qnaVO.qna_content}</textarea>
	</td>
	</tr>
</table>

	<div>
		<input type="submit" value="수정"> 
		<input type="reset"value="초기화">
		<a href="${context}/board/qna/list"> 
		<input type="button" value="목록으로"></a>
	</div>
</form>