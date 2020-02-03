<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 $(document).ready(function(){
	 $("#btnDelete").click(function(){
		 if(confirm("삭제하시겠습니가?")){
			 document.form.action = "${path}/board/faq/delete";
			 document.form.submit();
		 }
	 });
 });
	 $("#btnUpdate").click(function(){
		 var faq_title = $("faq_title").val();
		 var faq_head = $("faq_head").val();
		 var faq_content = $("faq_content").val();
		 if(faq_title ==""){
			 alert("말머리");
			 document.form.faq_title.focus();
			 return;
		 }
		 if(faq_head ==""){
			 alert("제목");
			 document.form.faq_title.focus();
			 return;
		 }
		 if(faq_content) ==""){
			 alert("내용"");
			 document.form.faq_title.focus();
			 return;
		 }
	 document.form.action="${path}/board/faq/update"
	 document.form.submit();
	 });
 });
</script>

<h2></h2>