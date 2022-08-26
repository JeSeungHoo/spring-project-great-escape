<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<style>
txt-hlight{
	background: yellow;
}
</style>


<section class="container">
	<div class="row">
		<div class="col-md-2">
			<div class="card mb-3">
				<div class="card-header">고객센터</div>
				<div class="list-group list-group-flush">
					<a href="${contextPath}/board/faq/${pm.makeQuery(1)}" class="list-group-item active" id="faqBoard">자주 묻는 질문</a> 
					<a href="${contextPath}/board/qna" class="list-group-item" id="qnaBoard">질문과 답변</a> 
					<a href="${contextPath}/board/notice" class="list-group-item" id="noticeBoard">공지사항</a>
				</div>
			</div>
		</div>
		<div class="col-md-10 mb-5">
			<h2 class="mb-4">자주 묻는 질문</h2>
			<div class="row mb-4">
				<div class="col-8 offset-2">
					<form action="">
						<div class="input-group mb-3">
							<span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									<path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
								</svg> </span> <input type="text" name="keyword" id="keyword"
								class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="검색어를 입력하세요">
							<button class="btn btn-dark" type="button" id="button-addon2">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row mb-4">
				<div class="btn-group" role="group">
					<button value="전체" type="button" class="btn btn-outline-dark"
						id="all">전체보기</button>
					<button value="해외여행" type="button" class="btn btn-outline-dark"
						id="trip">해외여행</button>
					<button value="항공" type="button" class="btn btn-outline-dark"
						id="airline">항공</button>
					<button value="예약/결제" type="button" class="btn btn-outline-dark"
						id="reservation">예약/결제</button>
					<button value="여권/비자/환전" type="button" class="btn btn-outline-dark"
						id="passport">여권/비자/환전</button>
					<button value="홈페이지/기타" type="button" class="btn btn-outline-dark"
						id="other">홈페이지/기타</button>
				</div>
			</div>
			
			<div class="accordion mb-3" id="accordionExample1">
			</div>
			<div id="listAll">
			<c:set var="number" value="0" />
			<c:choose>
				<c:when test="${list ne null }">
					<c:forEach var="faq" items="${list}">
						<c:set var="number" value="${number+=1}" />
						<div class="accordion mb-3" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-heading-${number}">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapse-${number}" aria-controls="panelsStayOpen-collapse-${number}">
										${faq.faq_category}&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; Q. ${faq.faq_title }
									</button>
								</h2>
								<div id="panelsStayOpen-collapse-${number}"
									class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading-${number}">
									<div class="accordion-body">A. ${faq.faq_content }</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<h1>게시글이 없습니다.</h1>
				</c:otherwise>
			</c:choose>
			</div>		
			
			<div id="paging">
			<nav id="allPaging" aria-label="Page navigation mb-3">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.first}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/faq/${pm.makeQuery(1)}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
						</li>
					</c:if>
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/faq/${pm.makeQuery(pm.startPage-1)}">&lt;</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<li class="page-item" ${pm.cri.page ==i? 'class=active':''}>
							<a class="page-link"
							href="${contextPath}/board/faq/${pm.makeQuery(i)}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/faq/${pm.makeQuery(pm.endPage+1)}">&gt;</a>
						</li>
					</c:if>
					<c:if test="${pm.last}">
						<li class="page-item"><a class="page-link"
							href="${contextPath}/board/faq/${pm.makeQuery(pm.maxPage)}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:if>
				</ul>
			</nav>
			</div>
			<c:if test="${userInfo.member_master eq 'Y'}">
				<div class="text-end mb-3">
					<button class="btn btn-outline-secondary" id="addBtn">추가하기</button>
				</div>
			</c:if>
		</div>
	</div>
</section>
<script>
	$("#addBtn").click(function() {
		location.href = "${contextPath}/board/faqWrite";
	});

	$("#qnaBoard").click(function() {
		location.href = "board/qna";
	});

	$("#faqBoard").click(function() {
		location.href = "board/faq";
	});

	$("#noticeBoard").click(function() {
		location.href = "board/notice";
	});

	$("#all").on("click", function() {
		let faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		location.href="${contextPath}/board/faq";
	});

	$("#trip").on("click", function() {
		$("#listAll").hide();
		$("#allPaging").hide();
		
		let faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		$.ajax({
			url : "${contextPath}/board/categoryList",
			type : "POST",
			dataType : "json",
			data : {
				"faq_category" : faq_category
			},
			success : function(data) {
				console.log(data);
				console.log(data.categoryList);
				console.log(data.categoryPm);
				var str="";
				console.log(data.category);
				var i = 0;
				$(data.categoryList).each(function(){
					
						let faq_category= this.faq_category;
						let faq_title= this.faq_title;
						let faq_content= this.faq_content;
						console.log(faq_category, faq_title, faq_content);
						str += '<div class="mb-3 accordion-item">';
						str += '<h2 class="accordion-header" id="headingOne-'+i+'">';
						str += '<button class="accordion-button collapsed" type="button"';
						str += 'data-bs-toggle="collapse" data-bs-target="#collapseOne'+i+'"';
						str += 'aria-expanded="true" aria-controls="collapseOne">'; 
						str += faq_category+'&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; Q.'+faq_title;
						str += '</button></h2>';
						str += '<div id="collapseOne'+i+'" class="accordion-collapse collapse"';
						str += 'aria-labelledby="headingOne-'+i+'" data-bs-parent="#accordionExample1">';
						str += '<div class="accordion-body"> A. ';
						str += faq_content;
						str += '</div>';
						str += '</div>';
						str += '</div>';
						i++;
				});
				$("#accordionExample1").html(str);
				
			},
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});

		
	});

	$("#airline").on("click", function() {
		var faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		$.ajax({
			url : "${contextPath}/board/categoryList",
			type : "POST",
			dataType : "json",
			data : {
				"faq_category" : faq_category
			},
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});

		$(".accordion").hide();
		$("#allPaging").hide();
	});

	$("#reservation").on("click", function() {
		var faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		$.ajax({
			url : "${contextPath}/board/categoryList",
			type : "POST",
			dataType : "json",
			data : {
				"faq_category" : faq_category
			},
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});

		$(".accordion").hide();
		$("#allPaging").hide();
	});

	$("#passport").on("click", function() {
		var faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		$.ajax({
			url : "${contextPath}/board/categoryList",
			type : "POST",
			dataType : "json",
			data : {
				"faq_category" : faq_category
			},
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});
	});

	$("#other").on("click", function() {
		var faq_category = $(this).val();
		console.log("faq_category: ", faq_category);
		$.ajax({
			url : "${contextPath}/board/categoryList",
			type : "POST",
			dataType : "json",
			data : {
				"faq_category" : faq_category
			},
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log("응 안돼 돌아가");
			}
		});

		$(".accordion").hide();
		$("#allPaging").hide();
	});

	$("#faqBoard").on("click", function() {
		$.ajax({
			url : "faqList",
			dataType : "json",
			type : "POST",
			success : function(data) {
				console.log(data);
			},
			error : function(result) {
				console.log(result);
			}
		});

	});

	
</script>
<%@ include file="../common/footer.jsp"%>