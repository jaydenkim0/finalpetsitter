<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
   	<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<!-- 에디터와 동일한 의존성 라이브러리 설정을 한다 -->
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
    
    
     <script>        
        $(function(){
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-viewer"),
                
                viewer:true,

                //height : 생성될 에디터의 높이
                height:'auto',
            };

            var viewer = tui.Editor.factory(options);

            //생성된 뷰어에 초기값 표시
            console.log(document.querySelector(".naver-viewer + input[type=hidden]"));
            var text = document.querySelector(".naver-viewer + input[type=hidden]").value;
            viewer.setValue(text);//값 설정
        });
    </script>
    
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
    
    <div class="box-container first">
		<h3> 펫시터 정보 </h3>
		<!-- 현재 페이지에서 펫시터 상태 휴면으로 전환가능 -->
		
		<a href="${pageContext.request.contextPath}/admin/petsitter"><button>펫시터페이지로 이동</button></a>
	</div>
		
	<table>
			<tbody>
				<tr>			
					<td>					
					아이디 : ${petsitter.sitter_id} 
					<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${petsitter.sitter_id}">
						<button> 회원정보 보기 </button>
					</a>			
					<a href="${pageContext.request.contextPath}/petsitter/content?pet_sitter_no=${petsitter.pet_sitter_no}">
						<button> 펫시터페이지 보기 </button> 
					</a>
					</td>					
				</tr>
				<tr>			
					<td>닉네임 : ${petsitter.nick}</td>					
				</tr>
				<tr>			
					<td>이메일 : ${petsitter.email}</td>					
				</tr>
				<tr>			
					<td>우편번호 : ${petsitter.post} | 주소 : ${petsitter.basic_addr}, ${petsitter.extra_addr}</td>						
				</tr>
				<tr>			
					<td> 반려동물 경험 유무   : ${petsitter.sitter_pets}</td>					
				</tr>
				<tr>			
					<td> 펫시터 가입일   : ${petsitter.getPetsitterdateWithFormat()}</td>					
				</tr>
				<tr>			
					<td> 펫시터 마지막로그인  : ${petsitter.getLastLogindateWithFormat()}</td>					
				</tr>
				
				<tr>			
					<td>
						펫시터 정보   : 
						<div class="naver-viewer"></div>  
						<input type="hidden"  value="${petsitter.info}">  
					 </td>					
				</tr>
				
				<tr>			
					<td> 펫시터 상태 (정상, 휴면)   : ${petsitter.sitter_status}</td>					
				</tr>
				
				<tr>			
					<td> 펫시터 서비스 종류 (방문, 돌봄, 둘다)   : ${petsitter.sitter_matching_type}</td>					
				</tr>
				
				<tr>			
					<td>등급 : ${petsitter.grade}</td>					
				</tr>			
				
				<tr>			
					<td>포인트 : ${petsitter.point}</td>					
				</tr>	
				<tr>			
					<td>은행 : ${petsitter.sitter_bankname}</td>					
				</tr>	
				<tr>			
					<td>계좌번호 : ${petsitter.sitter_bank_account}</td>					
				</tr>	
							
			
			<div class="box-container">
				<!-- 서비스 가능지역  -->
				<h4>서비스 가능지역</h4>
				<c:forEach var="petlocation" items="${petlocation}">					
					광역시 : ${petlocation.city}, 
					지역 : ${petlocation.area}			
				</c:forEach>
				
			</div>
			<div class="box-container">
				<!-- 돌봄 가능 동물종류  -->
				<h4>돌봄 가능 동물 종류</h4>
				<c:forEach var="pettypename" items="${pettypename}">
					 ${pettypename.care_type}
				</c:forEach>
				
			</div>
			<div class="box-container">	
				<!-- 서비스 가능 스킬  -->
				<h4> 서비스 가능 스킬 </h4>
				<c:forEach var="petskill" items="${petskill}">
					${petskill.skill_name}
				</c:forEach>
				
			</div>
			<div class="box-container">
				<!-- 펫시터 환경  -->
				<h4>펫시터 돌봄 가능 환경</h4>
				<c:forEach var="petcondition" items="${petcondition}">
					${petcondition.care_condition_name}
				</c:forEach>
				
			</div>
			</tbody>	
	</table>
	
		<div class="box-container">
			<!-- 펫시터가 업로드한 사진 받아오기 -->
			<!-- 
				소개이미지
				사진이 있는만큼 요청 
			-->
			<h3>소개이미지</h3>
			<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
				 <img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}"> 
			</c:forEach>
		</div>
		<div class="box-container">
			<!-- 신분증 -->
			<h3>신분증이미지</h3>
				<img src="${pageContext.request.contextPath}/admin/petsitter/sitteridcardimage?id_image_no=${sitterIdcardimg.id_image_no}"> 
		</div>
		<div class="box-container">
			<!-- 증빙서류 -->
			<h3>증빙서류이미지</h3>
				<img src="${pageContext.request.contextPath}/admin/petsitter/sitterlicenseimage?license_image_no=${sitterLicenseimg.license_image_no}">
		</div>
		<div class="box-container">
			<!-- 통장사본 -->
			<h3>통장사본</h3>
				<img src="${pageContext.request.contextPath}/admin/petsitter/sitterbankimage?bank_image_no=${sitterBankimg.bank_image_no}">	
		</div>
			
			
		<c:choose>			
			<c:when test="${petsitter.black_count == 0 || petsitter.black_count == null}">	
				<!-- 일반 펫시터에게 보여줄 내용 : 펫시터 상태 변경 -->l
				<form action="${pageContext.request.contextPath}/admin/petstatus" method=post>			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
						<input type="hidden" name="sitter_status" value="휴면">					
						<button type="submit" >펫시터  휴면 변경</button>						
				</form>		
				<!-- 펫시터 경고 등록 버튼 -->	
				<form action="${pageContext.request.contextPath}/admin/sitter_blacklist_content" method="get">			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">				
						<button type="submit" >경고 펫시터 등록</button>						
				</form>
			</c:when>
			<c:otherwise>
				<div style="color:red;">		
					<h3>※경고를 받은 펫시터입니다.  경고 내용은 블랙리스트 세부사항에서 확인하세요</h3>
					<h3>경고 횟수 : ${petsitter.black_count}</h3>			
					<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
					<form action="${pageContext.request.contextPath}/admin/sitter_delete" method="get">			
							<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">	
							<input type="hidden" name="sitter_no" value="${petsitter.pet_sitter_no}">				
							<button type="submit" >경고 펫시터 탈퇴</button>						
					</form>	
					<!-- 블랙리스트 디테일 페이지로 이동 -->
					<form action="${pageContext.request.contextPath}/admin/blackListdetail" method="get">			
							<input type="hidden" name="id" value="${petsitter.sitter_id}">										
							<button type="submit" >블랙리스트 세부사항으로 이동</button>						
					</form>	
									<form action="${pageContext.request.contextPath}/admin/petstatus" method=post>			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">
						<input type="hidden" name="sitter_status" value="휴면">					
						<button type="submit" >펫시터  휴면 변경</button>						
				</form>		
				<!-- 펫시터 경고 등록 버튼 -->	
				<form action="${pageContext.request.contextPath}/admin/sitter_blacklist_content" method="get">			
						<input type="hidden" name="sitter_id" value="${petsitter.sitter_id}">				
						<button type="submit" > 추가 경고 등록</button>						
				</form>
				</div>
			</c:otherwise>
		</c:choose>

	
	
	