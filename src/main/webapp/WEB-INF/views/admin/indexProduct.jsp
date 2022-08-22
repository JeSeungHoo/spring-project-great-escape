<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
	<div class="row">
		<div class="col-md-2">
			<div class="card mb-3">
				<div class="card-header">
					관리자 페이지
				</div>
				<div class="list-group list-group-flush">
					<a href="${contextPath}/board/service" class="list-group-item active">회원/관리자 목록</a>
					<a href="${contextPath}/board/service2" class="list-group-item">매출 관리</a>
					<a href="${contextPath}/board/service3" class="list-group-item">상품 관리</a>
				</div>
			</div>
		</div>
		<div class="col-md-10 mb-5">
			<h2 class="mb-5">- id001 회원 예약 내역</h2>
			<div class="card mb-4">
				<div class="card-header">
					<h3 class="card-title">원숭이와 함께 하는 온천 여행 !</h3>
					<p class="text-end card-text">2022/08/18 ~ 2022/08/24</p>
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<li class="list-group-item text-muted">123123</li>
						<li class="list-group-item">234251</li>
						<li class="list-group-item">ㄴㅁㅎㅇㄶ</li>
					</ul>
				</div>
				<div class="card-body">
					<p class="card-text">입금완료</p>
					<p class="card-text">10,000,000원</p>
					<p class="card-text">3박 4일</p>
					<p class="card-text">입금완료</p>
					<a href="#" class="card-link">링크</a>
					<p class="card-text">
						<small class="text-muted">작은글씨</small>
					</p>
					<p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet, iure, quod
						tempora quo porro libero fuga quam dolorem itaque voluptatum, expedita necessitatibus beatae
						alias ratione. Sed officiis ut itaque repellat.
						Beatae repudiandae facere fugiat, quidem rem ut illo! Quis nihil molestiae veritatis fuga et
						labore eius, nulla quas numquam! Nihil animi at temporibus amet totam iusto soluta quae. Fuga,
						distinctio?
						Perferendis facilis consequatur magni accusantium dolore laborum animi? Eveniet velit modi
						reiciendis voluptatibus quas voluptas illo quae perferendis recusandae tempore consectetur
						corrupti soluta obcaecati rerum, culpa veritatis aliquam neque asperiores!</p>
				</div>
				<div class="card-footer">
					<button class="btn btn-outline-secondary">예약 취소</button>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../common/footer.jsp" %>