<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/header.jsp"%>
<section class="container">
	<div class="row">
		<div class="col-md-2">
			<div class="card mb-3">
				<div class="card-header">고객센터</div>
				<div class="list-group list-group-flush">
					<a href="${contextPath}/board/faq" class="list-group-item" id="faqBoard">자주 묻는 질문</a> 
					<a href="${contextPath}/board/qna" class="list-group-item" id="qnaBoard">질문과 답변</a> 
					<a href="${contextPath}/board/notice" class="list-group-item active" id="noticeBoard">공지사항</a>
				</div>
			</div>
		</div>
	
		<div class="col-md-10 mb-5">
			<h2 class="mb-4">공지사항</h2>
			<div class="mb-4">
				<div class="btn-group" role="group">
					<button type="button" value="전체" class="btn btn-outline-dark" id="all">전체</button>
					<button type="button" value="공지사항" class="btn btn-outline-dark" id="notice">공지사항</button>
					<button type="button" value="외교부소식" class="btn btn-outline-dark" id="mofa">외교부소식</button>
				</div>
			</div>

			<div class="table-responsive" id="listAll">
				<table class="table table-striped">
					<thead>
					<tr class="table-warning">
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${noticeList ne null }">
							<c:forEach var="n" items="${noticeList }">
								<tr>
									<td class="col-sm-1">${n.notice_num}</td>
									<td class="col-sm-2">${n.notice_category}</td>
									<td class="col-sm-5"><a href="${contextPath}/board/noticeDetail?notice_num=${n.notice_num}">${n.notice_title}</a></td>
									<td class="col-sm-2">${n.notice_writer}</td>
									<td class="col-sm-2"><f:formatDate value="${n.notice_regdate}" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5"><h1>현재 게시글이 존재하지 않습니다.</h1></td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="table-responsive" id="listNotice"></div>
			<div class="table-responsive" id="listMofa"></div>
			

			<div id="pagingAll">
			<nav id="allPaging" aria-label="Page navigation mb-3">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.first}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/notice/${pm.makeQuery(1)}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
						</li>
					</c:if>
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/notice/${pm.makeQuery(pm.startPage-1)}">&lt;</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<li class="page-item" ${pm.cri.page ==i? 'class="active"':''}>
							<a class="page-link" href="${contextPath}/board/notice/${pm.makeQuery(i)}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/notice/${pm.makeQuery(pm.endPage+1)}">&gt;</a>
						</li>
					</c:if>
					<c:if test="${pm.last}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/notice/${pm.makeQuery(pm.maxPage)}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:if>
				</ul>
			</nav>
			</div>
			<c:if test="${userInfo.member_master eq 'Y'}">
					<div class="text-end mb-3">
						<button class="btn btn-outline-secondary" id="addBtn">새글 작성</button>
					</div>
			</c:if>
		</div>
	</div>
</section>
<script>
	$("#addBtn").click(function() {
		location.href = "${contextPath}/board/noticeWrite";
	});
	
	$("#all").on("click", function() {
		
		let notice_category = $(this).val();
		console.log("notice_category: ", notice_category);
		location.href="${contextPath}/board/notice";
	});

	$("#notice").on("click", function(){
		$(this).toggleClass("active");
		$("#mofa").removeClass("active");
		
		$("#listAll").hide();
		$("#listMofa").hide();
		
		let notice_category = $(this).val();
		console.log("notice_category: ", notice_category);
		
		$.ajax({
			url : "${contextPath}/board/categoryList/notice", type : "POST", dataType : "json",
			data : { "notice_category" : notice_category },
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(data) {
				console.log(data);
				console.log(data.noticeCategoryList);
				console.log(data.noticePm);
				let str="";
				let i = 0;
				str += '<table class="table table-striped">';
				str += '<thead>';
				str += '<tr><th>번호</th><th>구분</th><th>제목</th><th>작성자</th><th>작성일</th>';
				str += '<tr>';
				str += '</thead>';
				str += '<tbody>';
				$(data.noticeCategoryList).each(function(){
					let notice_num= this.notice_num;
					let notice_category= this.notice_category;
					let notice_title= this.notice_title;
					let notice_content= this.notice_content;
					let notice_writer= this.notice_writer;
					let notice_regdate= this.notice_regdate;
					
					console.log(notice_category, notice_title, notice_content);
						str += '<tr>';	
						str += '<td class="col-sm-1">'+notice_num+'</td>';
						str += '<td class="col-sm-2">'+notice_category+'</td>';
						str += '<td class="col-sm-5"><a href="/greatescape/board/noticeDetail?notice_num='+notice_num+'">'+notice_title+'</a></td>';
						str += '<td class="col-sm-2">'+notice_writer+'</td>';
						str += '<td class="col-sm-2">'+notice_regdate+'</td>';
						str += '</tr>';		
				});
				str += '</tbody>';
				str += '</table>';	
				$("#listNotice").html(str);
				
				//$("#pagingTrip").html(strPaging);
			},// success
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});
		$("#listNotice").show();
	});
	
	$("#mofa").on("click", function(){
		$(this).toggleClass("active");
		$("#notice").removeClass("active");
		
		$("#listAll").hide();
		$("#listNotice").hide();
		
		let notice_category = $(this).val();
		console.log("notice_category: ", notice_category);
		
		$.ajax({
			url : "${contextPath}/board/categoryList/mofa", type : "POST", dataType : "json",
			data : { "notice_category" : notice_category },
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(data) {
				console.log(data);
				console.log(data.mofaList);
				console.log(data.mofaPm);
				let str="";

				str += '<table class="table table-striped">';
				str += '<thead>';
				str += '<tr><th>번호</th><th>구분</th><th>제목</th><th>작성자</th><th>작성일</th>';
				str += '<tr>';
				str += '</thead>';
				str += '<tbody>';
				$(data.mofaList).each(function(){
					let notice_num= this.notice_num;
					let notice_category= this.notice_category;
					let notice_title= this.notice_title;
					let notice_content= this.notice_content;
					let notice_writer= this.notice_writer;
					let notice_regdate= this.notice_regdate;
					console.log(notice_category, notice_title, notice_content);
						str += '<tr>';	
						str += '<td class="col-sm-1">'+notice_num+'</td>';
						str += '<td class="col-sm-2">'+notice_category+'</td>';
						str += '<td class="col-sm-5"><a href="/greatescape/board/noticeDetail?notice_num='+notice_num+'">'+notice_title+'</a></td>';
						str += '<td class="col-sm-2">'+notice_writer+'</td>';
						str += '<td class="col-sm-2">'+notice_regdate+'</td>';
						str += '</tr>';		
				});
				str += '</tbody>';
				str += '</table>';	
				$("#listMofa").html(str);
				
				//$("#pagingTrip").html(strPaging);
			},// success
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});
		$("#listMofa").show();
	});
	
	
	
	
	
	
	
	
</script>
<%@ include file="../common/footer.jsp"%>