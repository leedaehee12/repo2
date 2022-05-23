<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="qna_head.jsp"%>

<script type="text/javascript">
	function go_list() {
		var theForm = document.frm;
		theForm.action = "${contextPath}/admin/qna/qnaList";
		theForm.submit();
	}

	function go_rep(qseq) {
		var theForm = document.frm;
		theForm.qseq.value = qseq;
		theForm.action = "${contextPath}/admin/qna/qnaRepsave";
		theForm.submit();
	}
</script>

<article class="pt-5">

	<h3 class="ml-2 mb-5">Q&amp;A 게시판</h3>
	
	<form name="frm" method="post">
	
		<input type="hidden" name="qseq">
		
		<table class="table">
			<tr>
				<th width="20%">제목</th>
				<td>${qnaVO.subject} ${qnaVO.rep}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaVO.indate}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qnaVO.content}</td>
			</tr>
		</table>
		
		<c:choose>
			<c:when test='${qnaVO.rep=="1"}'>
				<table class="table">
					<tr>
						<td colspan="2">
						
							<b>고객 응대 답글 등록</b><br>
						
							<div class="mt-3 mb-2">
								<textarea class="form-control" style="resize:none" name="reply" rows="3" cols="50"></textarea>
							</div>
							
							<div  class="d-flex flex-row-reverse">
								<input type="button" class="btn btn-secondary mt-3" value="저장"
									onClick="go_rep('${qnaVO.qseq}')">
							</div>	
						</td>
					</tr>
				</table>
				<br>
			</c:when>
			
			<c:otherwise>
				<table class="table">
					<tr>
						<th>댓글</th>
						<td>${qnaVO.reply}</td>
					</tr>
				</table>
			</c:otherwise>
			
		</c:choose>
		
		<div class="w-100 d-flex justify-content-center">
			<input type="button" class="btn btn-secondary" value="목록" onClick="go_list()">
		</div>
		
	</form>

</article>

<%@ include file="../footer.jsp"%>