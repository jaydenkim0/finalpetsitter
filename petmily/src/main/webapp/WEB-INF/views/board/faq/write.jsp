<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/npm/suneditor@latest/assets/css/suneditor.css" rel="stylesheet"> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/suneditor@latest/assets/css/suneditor-contents.css" rel="stylesheet"> -->
<style>
    textarea[name=content]{
        width:100%;
        height:150px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<!-- languages (Basic Language: English/en) -->
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
    function loadEditor(){
        var editor = SUNEDITOR.create((document.querySelector('textarea[name=content]')),{
            //언어 설정
            lang: SUNEDITOR_LANG['ko'],
            
            //버튼 목록
            buttonList:[
            	 ['font','fontSize','fontColor'],
                 ['underline','italic', 'bold','paragraphStyle','formatBlock'],
                 ['align','table','image']

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
	    	var faq_content = document.querySelector("textarea[name=content]");
	    	content.value = editor.getContents();
	    }
    }
    
    //윈도우 로딩 시 loadEditor를 실행하도록 설정(body에 onload 한 효과)
    window.onload = loadEditor;
</script>

<div align="center">
	<h2>공지글 작성</h2>
	<form name="faqDto" method="post" action="insert">
      <input type="hidden" name="member_id" value="${session.id }">
		<table border="1" width="70%">
        <div>
        말머리
        	<select name="faq_title" >
        		<option>전체공지</option>
        			<option>펫시터공지</option>
        				<option>유저공지</option>
        	</select>
        </div><br>
        <div>제목<input name="faq_head" id="faq_head" size="80" placeholder="글 제목 입력"></div><br>
        <div>내용<textarea name="faq_content" id="faq_content" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
        <div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
        </div>
      </table>
  </form>