<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    <style>
    img{
    	max-width:50%;
    }
    .box-container{
    	padding: 17px 10px;
	    border-bottom: 1px dashed #ddd;
	    
    }
    .box-container:nth-of-type(even){
    	background: #f2f2f2;
    }
    
    .box-container h4,
    .box-container h3{
    	margin-top:0;
    }
    /***button***/
    a{
     	color:#333;
     }
	 a button,
	 button{
	 	background: #146fbd;
	    padding: 7px 14px;
	    color: #fff;
	    border: 0;
	    font-weight: bold;
	    border-radius:3px;
	 }
	  a:hover button,
	  button:hover{
	 	background: #10538c;
	 }
	 /***table****/
	 table{
		 width: 100%;
	    border-top: 2px solid #808080;
	    margin-top: 17px;
	    border-bottom: 2px solid #808080;
	    /* padding: 17px 0; */
	    margin-bottom: 17px;
	    border-collapse:collapse;
    }
    table tr{
    	border-bottom: 1px solid #ddd;
    	/*text-align:center;*/
    }
    
    table tr th {
	    background: rgba(20, 111, 189, 0.2);
	    border-bottom: 1px solid #ddd;
	    padding: 10px 0;
	    border-right: 1px solid #fff;
	    color:#333;
	}
	table tr th:last-child,
	table tr td:last-child{
		border-right:0;
	}
	table tr td {
	    border-right: 1px solid #ddd;
	    padding: 10px 0;
	    color:#333;
	    padding-left:15px;
	}
	table tr td a{
		color:#333;
	}
    </style>    
    
	<a href="${pageContext.request.contextPath}/admin/blackList"><button>블랙리스트 페이지로 이동</button></a>	
    <div class="box-container first">    
		<h3>블랙리스트 정보 디테일 페이지</h3>	
	</div>
	
	<c:choose>			
			<c:when test="${blackListdetail.black_grade eq 'petsitter'}">
				<div style="color:red;">
					<table>
						<tr>
							<td> 아이디 : ${blackListdetail.black_id}						
							<a href="${pageContext.request.contextPath}/admin//petsitter/petsitterdetail?pet_sitter_no=${blackListdetail.pet_sitter_no}">							
							<button> 회원정보 보기 </button>
							</a>
							</td>				
						</tr>
						<tr>
							<td> 이름 : ${blackListdetail.black_name}</td>				
						</tr>
							<tr>
							<td> 연락처 : ${blackListdetail.black_phone}</td>									
						</tr>
						<tr>
							<td> 등급 : ${blackListdetail.black_grade}</td>				
						</tr>
						<tr>
							<td> 경고 횟수 : ${blackListdetail.black_count}</td>				
						</tr>		
					</table>		
				
					<h3>※아래와 같은 사유로 경고를 받은 펫시터입니다</h3>
							<hr>						
							<c:forEach var="blacklistcontent" items="${blacklistcontent}">						
							<!-- 경고받을때 등급 -->
								<h5> 경고 등급 : ${blacklistcontent.black_content_grade} </h5>
							<!-- 경고 사유  -->
								<h5> 경고 내용 : ${blacklistcontent.black_content} </h5>
							<!--  경고 등록일-->
								<h5> 경고 등급 : ${blacklistcontent.getBlackListdateWithFormat()} </h5>
							<hr>		
							</c:forEach>
					
							
					<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
					<form  action="${pageContext.request.contextPath}/admin/sitter_delete" method="get">			
							<input type="hidden" name="sitter_id" value="${blackListdetail.black_id}">	
							<input type="hidden" name="sitter_no" value="${blackListdetail.pet_sitter_no}">				
							<button  type="submit" >경고펫시터 탈퇴</button>						
					</form>
					
					<!-- 정상 펫시터로 복귀 -->
					<form action="${pageContext.request.contextPath}/admin/blackList/comebackPet" method="get">
							<input type="hidden" name="black_id" value="${blackListdetail.id}">							
							<button>펫시터 복귀</button>
					</form>
					
				</div>
			</c:when>	
			<c:otherwise>
				<div style="color:#ff8d00;">
									<table>
						<tr>
							<td> 아이디 : ${blackListdetail.black_id}
							<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${blackListdetail.black_id}">
								<button> 회원정보 보기 </button>
							</a>
							</td>				
						</tr>
						<tr>
							<td> 이름 : ${blackListdetail.black_name}</td>				
						</tr>
							<tr>
							<td> 연락처 : ${blackListdetail.black_phone}</td>									
						</tr>
						<tr>
							<td> 등급 : ${blackListdetail.black_grade}</td>				
						</tr>
						<tr>
							<td> 경고 횟수 : ${blackListdetail.black_count}</td>				
						</tr>		
					</table>		
				
					<h3>※아래와 같은 사유로 경고를 받은 회원입니다</h3>
							<hr>						
							<c:forEach var="blacklistcontent" items="${blacklistcontent}">						
							<!-- 경고받을때 등급 -->
								<h5> 경고 등급 : ${blacklistcontent.black_content_grade} </h5>
							<!-- 경고 사유  -->
								<h5> 경고 내용 : ${blacklistcontent.black_content} </h5>
							<!--  경고 등록일-->
								<h5> 경고 등급 : ${blacklistcontent.getBlackListdateWithFormat()} </h5>
							<hr>		
							</c:forEach>
					
					<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
					<form action="${pageContext.request.contextPath}/admin/member_delete" method="get">			
							<input type="hidden" name="id" value="${blackListdetail.black_id}">				
							<button type="submit" >경고회원 탈퇴</button>						
					</form>	
					<!-- 정상 회원으로 복귀 -->						
					<form action="${pageContext.request.contextPath}/admin/blackList/comebackMember" method="get">
							<input type="hidden" name="black_id" value="${blackListdetail.id}">							
							<button>회원 복귀</button>
					</form>
				</div>
		</c:otherwise>
	</c:choose>			