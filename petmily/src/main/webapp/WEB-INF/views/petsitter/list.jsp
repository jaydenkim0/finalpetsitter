<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
   <script>
   function list(page){
// 		console.log("키워드");
	   if("${cityKeyword}" === "" && "${areaKeyword}" === ""){
			location.href="${pageContext.request.contextPath}/petsitter/list?curPage="+page;
// 			 console.log("키워드 없음");
		}else{
			location.href="${pageContext.request.contextPath}/petsitter/list?curPage="+page+"&cityKeyword=${cityKeyword}"+"&areaKeyword=${areaKeyword}";			
// 			console.log("키워드 있음");
		}
	}
   </script>
   
	<script>
	 $(function(){
		//지역 관리 스크립트
         $.ajax({
             url:"../res/json/petmily_location.json", 
             type:"get",             
             dataType:"json",       
             success:function(resp){ 
             for(var i in resp){
                 $("<option>").text(i).appendTo(".region");
                 }    
             }
         });
         $(".region").change(function(){
             var region_text = $(this).children("option:selected").text();
             console.log("시 : "+ region_text);
             var city=$(this).val();
             $.ajax({
                     url:"../res/json/petmily_location.json",  
                     type:"get",             
                     dataType:"json",       
                     success:function(resp){ 
                         $(".section").empty();
                         $(resp[city]).each(function(){
                             $("<option>").text(this).appendTo(".section");
                             });
                     }
             });
         });
         $(".section").change(function(){
             var section_text = $(this).children("option:selected").text();
             console.log("군,구 : "+section_text);
         });  
	}); 
    </script>
	
	<h1>펫시터 정보 조회</h1>

		<form method="post" action="${pageContext.request.contextPath}/petsitter/list">
			 <div class="location">
			    <div class="template">
			        <select class="region" name="cityKeyword">
			            <option>지역을 선택하세요</option>
			        </select>
			        
			        <select class="section" name="areaKeyword">
			            <option>구를 선택하세요</option>
			        </select>

			    	<input type="submit" value="검색">
			    </div>
			    <div id="result"></div>
			</div>
		</form>
		
		
		<h4>${count}개의 게시물이 있습니다.</h4>
	
		<c:forEach var="petsitter" items="${list}">
			<!-- 펫시터 정보 -->
			<a href="content?pet_sitter_no=${petsitter.pet_sitter_no}">
				<span>닉네임 : ${petsitter.nick}</span></a>
				<br>
				<span>소개글 : ${petsitter.info}</span><br>
					<c:forEach var="location" items="${petsitter.list}">
						<span>지역 : ${location.city} ${location.area}</span><br>
					</c:forEach>
				<hr>
			</c:forEach>
	
		<!-- 페이징 -->
		<table>
			<tr>
				<td colspan="5">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
					<c:if test="${navi.curBlock > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curBlock > 1}">
						<a href="javascript:list('${navi.prevPage}')">[이전]</a>
					</c:if>
					
					<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
					<c:forEach var="num" begin="${navi.blockBegin}" end="${navi.blockEnd}">
						<!-- 현재페이지이면 하이퍼링크 제거 -->
						<c:choose>
							<c:when test="${num == navi.curPage}">
								<span style="color: red">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curBlock <= navi.totBlock}">
						<a href="javascript:list('${navi.nextPage}')">[다음]</a>
					</c:if>
					
					<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
					<c:if test="${navi.curPage <= navi.totPage}">
						<a href="javascript:list('${navi.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>