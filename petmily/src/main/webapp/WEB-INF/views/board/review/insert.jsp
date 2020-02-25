<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style></style>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/star/hakademy-star.min.js"></script>
    <script>
        window.addEventListener("load", function(){
            Hakademy.PointManager.factory(".star-wrap");
        });
    </script>
    <!-- 에디터 불러오기 -->
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<style>
    textarea[name=review_content]{
        width:100%;
        height:150px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<!-- languages (Basic Language: English/en) -->
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
    function loadEditor(){
        var editor = SUNEDITOR.create((document.querySelector('textarea[name=review_content]')),{
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
	    	var review_content = document.querySelector("textarea[name=review_content]");
	    	review_content.value = editor.getContents();
	    }
    }
    
    //윈도우 로딩 시 loadEditor를 실행하도록 설정(body에 onload 한 효과)
    window.onload = loadEditor;
</script>

    <h2>리뷰 작성</h2>
    <form action="insert" method="post" enctype="multipart/form-data">
<!--     <div>번호:<input type="text" name="review_no"></div> -->
    <input type="hidden" name="review_writer" value="${id}">
	<table border="1" width="70%">
	<tr>
	 <th>작성자</th>
    <td>${id}</td>  
    </tr>
    <tr>
    <th>팻시터번호</th>
    <td> <input type="text" name="review_sitter_no" required></td>
    </tr>
    <tr>
  	<th>제목</th>
  	<td><input type="text" name="review_title" required></td>
  	</tr>
  	<tr>
    <th>내용</th>
    <td><textarea name="review_content" id="review_content" rows="15" cols="100" 
    				style="resize:vertical;" placeholder="글내용입력" required></textarea> </td>
    </tr>
    <tr>				
    <th>별점</th>
    <!--     <input type="text" name="review_star"></div> -->
      
   <td>
   <select name="review_star" required>
   <option value="">선택</option>
   <option value=3>좋음(3)★★★</option>
   <option value=2>보통(2)★★</option>
   <option value=1>나쁨(1)★</option>
   </select>
   </td>
   </tr>
    <tr>
     <input type="hidden" name="review_reservation_no" readonly>
    </tr>
     <tr>
    <td colspan="2" align="center">
   <input type="submit" value="확인">
     </td>
   </tr>
    </table>
    </form>
    </body>
    </html>