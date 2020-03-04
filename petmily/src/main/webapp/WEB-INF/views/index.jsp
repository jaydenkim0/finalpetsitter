<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	PetMily 메인
</h1>
<c:if test="${grade=='admin'}">
	<a href="admin/"><button>관리자 메인</button></a>
</c:if>
<a href="board/care/list"><button>돌봄게시판</button></a>
<a href="board/qna/list"><button>문의게시판</button></a>
<a href="board/faq/list"><button>공지사항게시판</button></a>
<a href="petsitter/list"><button>펫시터 조회</button></a>
<a href="board/stray/list"><button>Save the Pets!</button></a>


<p>로그인 아이디 : ${id} </p>
<p>로그인 등급 : ${grade}</p>


<c:if test="${not empty id }">

	<c:if test="${param.blackcount>0 }">
		<h3>
			${id }님은 경고 횟수 ${param.blackcount } 블랙리스트 회원입니다.
		</h3>
	</c:if>

	<c:if test="${grade!='petsitter' }">
		<a href="petsitter/regist"><button>펫시터 가입</button></a>
	</c:if>
	
	<a href="member/mypage">
		<button>마이페이지</button>
	</a>
	
	<a href="member/logout">
			<br><br><input type="button" value="로그아웃">
	</a>

</c:if>


<c:if test="${empty id }">
	<a href="member/login">
			<input type="button" value="로그인">
	</a>
</c:if>


</body>
</html>
