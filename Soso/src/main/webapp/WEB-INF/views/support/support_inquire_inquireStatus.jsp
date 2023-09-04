<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 접수 내역</title>
<link rel="shortcut icon" type="image/x-icon" href="${path }/resources/images/main/favicon.jpg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_inquire_MyInquire.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
	<div class="main_area">
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
		<div class="body_area">
			<div class="main_content">
				<ul class="inquire_navi">
					<c:if test="${isAdmin }">
						<li>
							<a class="cs_inquire" href="${pageContext.request.contextPath }/support/support_inquire_inquireStatus">문의 접수 내역</a>
						</li>
					</c:if>
				</ul>
				<h3 class="title">사용자 문의 접수 내역</h3>
				<table class="table-data">
					<thead>
						<tr>
							<th class="date">등록일</th>
							<th class="title">문의 제목</th>
							<th class="status">문의 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${list2}">
							<tr class="inquire-list">
								<td>
									<table class="main-data">
										<tbody>
											<tr class="summary-data">
												<td class="date">${tmp.regdate }</td>
												<td class="title">
													<a href="">${tmp.title }</a>
												</td>
												<td class="status">답변대기</td>
											</tr>
											<tr class="btn-area">
												<td><button type="button" class="btn_more">답변보기</button></td>
											</tr>
											<tr class="detail-data">
												<td class="detail-td">
													<div class="inquiry-content">
														<div class="description">
															<button data-num="${tmp.cs_num}" type="submit" class="delete-btn">삭제</button>
															<a class="answer-btn" href="${pageContext.request.contextPath }/support/support_inquire_answerform">답변등록</a>
															${tmp.content }
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
				$(document).ready(function(){
					$(".btn_more").click(function(e){
						e.preventDefault();
						$(this).closest(".main-data").find(".detail-td").toggle();
					});
					// 처음에는 숨겨두기
					$(".detail-td").hide();
				});
				document.querySelectorAll(".delete-btn").forEach((item)=>{
					item.addEventListener("click", (e)=>{
						e.preventDefault();
							const csNum=e.target.getAttribute("data-num");
							location.href="${pageContext.request.contextPath}/support/support_inquire_delete?cs_num=" + csNum;
					});
				});
		</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>




