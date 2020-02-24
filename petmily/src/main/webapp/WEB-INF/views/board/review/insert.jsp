<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
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
</head>
    
    <form action="insert" method="post">
    <input type="hidden" name="review_writer" value="${id}">
<!--     <div>번호:<input type="text" name="review_no"></div> -->
    <div>작성자:<br>
     <div>${id}</div>  
    <div>팻시터번호:<br>
    <input type="text" name="review_sitter_no" required></div>
  	<div>제목:<br>
  	<input type="text" name="review_title" required></div>
    <div>내용:<br>
    <textarea name="review_content" rows="4" cols="50" required></textarea> </div>
    <div>별점:<br>
<!--     <input type="text" name="review_star"></div> -->
   <select name="review_star" required>
   <option value="">선택</option>
   <option value="3">좋음(3)★★★</option>
   <option value="2">보통(2)★★</option>
   <option value="1">나쁨(1)★</option>
   </select></div>
   <br>
    
   <input type="submit" value="생성">
   
    
    </form>
    </body>
    </html>