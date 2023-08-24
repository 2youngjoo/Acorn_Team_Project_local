<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_faq_user</title>
<style>
.btn_more{
	background-image: url("https://static.onoffmix.com/images/pc/svg/arrow_up_bl.svg");
	width:100%;
	height: 64px;
	top: 0;
	left: 0;
	z-index: 1;
	background: transparent url("https://static.onoffmix.com/images/pc/svg/arrow_down.svg") no-repeat 98.5% center;
	text-decoration: none;
	text-align: left;
	cursor: pointer;
	overflow: hidden;
	text-indent: -9999em;
	position: absolute;
	box-sizing: border-box;
	display: block;
	border: 1px solid transparent;
	}
	.dropbox .detail_content{
	position: relative;
	padding: 40px 50px 90px;
	box-sizing: border-box;
	width: 100%;
	font-size: 14px;
	background-color: #fafafa;
	overflow-x: hidden;
	overflow-y: auto;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_faq.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
    <main id="main-banner" class="main-banner-06">
        <div class="inner-wrap">
            <div class="title">
                <h2>고객센터</h2>
                <p>
			                    서비스 이용 중 불편 했던 점이나 궁금한 점을 <br />
			                    빠르고 친절하게 안내해 드리겠습니다.
                </p>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="#" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">BOOKMATE</div>

            </div>
        </div>
    </main>
	<!-- 메인 메뉴바 시작 -->
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav- active" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
	<!-- 메인 메뉴바 끝 -->
	<!-- 검색 창 시작 -->
	<div class="search">
		<form action="" class="search_form" method="get">
			<input type="text" name="" id="" class="search_main" placeholder="예) 회원가입, 로그인, 결제 등" />
			<input type="submit" class="search_cs" value="" />
		</form>
	</div>
	<!-- 검색 창 끝 -->
		<div class="main_content">
			<div class="tab_section">
			<ul class="tab_menu">
				<li class="active">
					<a href="${pageContext.request.contextPath }/support/support_faq">전체(${totalRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_user">회원(${categoryOneRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_request">모임신청(${categoryTwoRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_open">모임개설(${categoryThreeRow })</a>
				</li>
				<li class="">
					<a href="${pageContext.request.contextPath }/support/support_faq_etc">기타(${categoryZeroRow })</a>
				</li>
			</ul>
			</div>
			<h3 class="faq">회원(${categoryOneRow})</h3>
			<div class="tab_content">
			<ul>
				<c:forEach var="tmp" items="${listCategory }">
					<c:if test="${category eq 1}">
					<li class="dropbox">
						<button type="button" class="btn_more">답변</button>
						<div class="title_area">
						<c:choose>
								<c:when test="${tmp.category == 1}">회원</c:when>
								<c:when test="${tmp.category == 2}">모임신청</c:when>
								<c:when test="${tmp.category == 3}">모임개설</c:when>
								<c:when test="${tmp.category == 0}">기타</c:when>
						</c:choose>
							<h5 class="detail">${tmp.question }</h5>
						</div>
						<div class="detail_content">
							<span style="line-height: 24px;">
								<pre>${tmp.answer }</pre>
							</span>
						</div>
					</li>
					</c:if>
				</c:forEach>
			</ul>
			</div>
		</div>
	<div>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a href="support_faq_user?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a href="support_faq_user?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
					</li>
				</c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				 --%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a href="support_faq_user?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		
			$(document).ready(function(){
				
				$(".btn_more").click(function(e){
					e.preventDefault();
					$(this).closest(".dropbox").find(".detail_content").toggle();
				});
				// 처음에는 숨겨두기
				$(".detail_content").hide();
			});
		</script>
	</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





