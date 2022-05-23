<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<%@ include file="sub_img.jsp"%>
<%@ include file="sub_menu.jsp"%>

<article>

	<h3 class="my-4">1:1 고객 게시판</h6>
	
	<h6 class="my-4">고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h6>
	
	<form name="formm" method="post">
	
		<table class="table">
			<tr>
				<th>제목</th>
				<td>${qnaVO.subject}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaVO.indate}" type="date" /></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td>${qnaVO.content}
			</tr>
			<tr>
				<th>답변 내용</th>
				<td>${qnaVO.reply}
			</tr>
		</table>
		
		<div id="buttons" class="row col-10 float-end">
		
			<div class="col-2"></div>
			
          	<div class="col-4 pr-1">
          	
				<input type="button" class="btn btn-secondary" value="목록보기"
					onclick="location.href='${contextPath}/qna/qnaList'"> 
			</div>
			
			<div class="col-3">	
				<input type="button" class="btn btn-secondary" value="쇼핑 계속하기"
					onclick="location.href='${contextPath}/'">
			</div>
			
			<div class="col-1"></div>		
			
		</div>
	</form>

</article>

<%@ include file="../footer.jsp"%>