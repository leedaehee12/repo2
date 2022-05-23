<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<%@ include file="sub_img.jsp"%>
<%@ include file="sub_menu.jsp"%>

<article>

	<h3 class="my-4">1:1 고객 게시판</h3>
	
	<h6  class="my-4">고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h6>
	
	<form name="formm" class="form" method="post"
		  action="${contextPath}/qna/qnaWrite">
		
		<fieldset>
			<legend class="py-3">게시글 쓰기</legend>
			<label>Title</label> 
			<input type="text" class="form-control" name="subject" size="77">
			<br>
			<label>Content</label>
			<textarea class="form-control" style="resize: none" 
				rows="8" cols="65" name="content"></textarea>
			<br>
		</fieldset>

		
		<div id="buttons" class="row col-10 float-end">
		
			<div class="col-4"></div>
			
          	<div class="col-2 pr-1">
				<input type="submit" class="btn btn-secondary" value="글쓰기">
			</div>
			
			<div class="col-2 pr-1">	
				<input type="reset" class="btn btn-secondary"  value="취소"> 
			</div>
			
			<div class="col-3">	
				<input type="button" class="btn btn-secondary" value="쇼핑 계속하기"
					onclick="location.href='${contextPath}/'">
			</div>
			
			<div class="col-1"></div>			
			
		</div>	
		</div>
	</form>

</article>

<%@ include file="../footer.jsp"%>