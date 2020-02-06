<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<h3> 펫시터 정보 </h3>
	<!-- 현재 페이지에서 펫시터 상태 휴면으로 전환가능 -->
		${petsitter}
	<table>
	<tbody>
		<tr>			
			<td>아이디 : ${petsitter.sitter_id}</td>					
		</tr>
		<tr>			
			<td>닉네임 : ${petsitter.nick}</td>					
		</tr>
	
	</tbody>	
	</table>
	
	