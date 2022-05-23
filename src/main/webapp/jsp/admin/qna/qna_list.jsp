<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="qna_head.jsp"%>

<script type="text/javascript">
	function go_view(qseq) {
		var theForm = document.frm;
		theForm.qseq.value = qseq;
		theForm.action = "${contextPath}/admin/qna/qnaDetailForm";
		theForm.submit();
	}
</script>

<article class="pt-5">

	<!-- <h1>Q&amp;A 게시글 리스트</h1> -->
	
	<form name="frm" method="post">
	
		<input type="hidden" name="qseq">
		
		<table id="orderList" class="table">
		
			<tr>
				<th>번호</th>
				<th>게시글 번호(답변여부)</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach items="${qnaList}" var="qnaVO" varStatus="st">
				<tr>
					<td>${pageVO.limit * (pageVO.currPage-1) + st.count}</td>
					<td>${qnaVO.qseq} 
						<c:choose>
							<c:when test="${qnaVO.rep=='1'}">(미처리)</c:when>
							<c:otherwise>(답변처리완료)</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="javascript:go_view('${qnaVO.qseq}')">
							${qnaVO.subject} 
						</a></td>
					<td>${qnaVO.id}</td>
					<td><fmt:formatDate value="${qnaVO.indate}" /></td>
				</tr>
			</c:forEach>
			
		</table>
		
	</form>
	
	<!-- 페이징 -->
	<%@ include file="qna_list_paging.jsp" %>
	
</article>

<%@ include file="../footer.jsp"%>