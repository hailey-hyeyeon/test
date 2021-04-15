<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>인턴프로젝트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="FqXMAnwaMTsf5yfUvdmWufX8XqLazGL59qUM3IHfb0j1fWYCDNuv4bISmEPOR4/eBdk06e7VYJT12gH+EdiXwg==" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
h2 {
	text-align: center;
	margin: 10px 5px 30px;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 100%;
	margin: auto;
}

a {
	text-decoration: none;
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: fixed;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #008080;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 90%;
}

.footer {
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
	text-align: center;
	color: black;
}

div#head {
	position: absolute;
	left: 40%;
	top: 30%
}

div#user {
	position: absolute;
	right: 3%;
	top: 30%
}

ul#menu {
	position: absolute;
	top: 8%
}

.dropdown
{
background-color: teal;
}


.dropdown-menu {
color: white;
background-color:#403f3f;
}

.dropdown-menu li a{
		text-decoration: none;
		display: block;
		color: #000;
		padding: 8px 15px 8px 15px;
}


.dropdown-menu a:hover {
	color: #ffffff !important;
	background:teal;
	border-color: #42423e;
}

.cardwrapper {
	display: flex;
	position: relative;
	width: 70%;
	margin-left: 300px;
	padding: 3rem 3rem;
	justify-content: space-between;
}

.cardwrap {
	display: flex;
	width: 400px;
	height: 450px;
	flex-direction: column;
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.15);
	border-radius: 2rem;
	cursor: pointer;
}

.boardwrap {
	width: 100%;
	/* height: auto; */
	height: 370px;
	display: flex;
	align-items: top;
	justify-content: center;
	background: #f5f5dc;
	/*border-bottom: solid 1px;*/
	border-radius: 0 0 1rem 1rem;
}

.boardwrap:hover {
	background-color: #ffffff;
	opacity: 0.5;
}

.textwrap {
	width: 100%;
	height: 5rem;
	display: flex;
	justify-content: space-around;
	background: #008080;
	border-radius: 1rem 1rem 0 0;
}

.left-text {
	text-align: center;
	font-size: large;
	display: flex;
	align-items: center;
	color: white;
}

.right-text {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}

.table {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#writeBtn").click(function() {
							location.href = "write";
						})
						
						$("#restoreBtn").click(function() {
							location.href = "restore";
						})
						
						$
								.ajax({
									url : "boardList",
									success : function(result) {
										console.log(result);
										var html = "";
										result
												.forEach(function(item) {
													html += "<tr> <td><a href = 'view?idx="
															+ item.idx
															+ "'>"
															+ item.title
															+ "</a>"
															+ "<button type='button' class='btn btn-primary' style='float: right;' id = 'restoreBtn' onclick = 'location.href = 'view?idx='"
															+ item.idx
															+ "'>글복구</button></td> </tr>"
												})
										$("#listArea").append(html);
										$("#listArea1").append(html);
										$("#listArea2").append(html);
										$("#listArea3").append(html);
										$('#example').DataTable();
									}
								});
						$("#deleteBtn").click(function() {
							location.href = "delete";
						})
						
						$("#restoreBtn").click(function() {
							location.href = "restore";
						})
						$("#updateBtn").click(function() {
							location.href = "update";
				})
						
					});
	/* 
	 html+= "<tr> <td><a href = 'view?idx=" + item.idx + "'>" + item.title + "</a></td> </tr>"
	 + "<button type='button' class='btn btn-primary' align='right' id = 'deleteBtn'>글삭제</button></td> </tr>"
	 <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	 */
</script>

</head>
<body>
	<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
		<a class="navbar-brand" href="index">
			<div>
				<img class="sbdc" alt="SBDC" width="180" height="65"
					src="data:image/jpeg;base64,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">
			</div>
			<div id="head">
				<h3>인턴 프로젝트 게시판</h3>
			</div>
			<div id="user">
				<h5>임시사용자</h5>
			</div>
		</a>

	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: white; font-size: 20px;">홈</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color: white; font-size: 20px;">게시판
					</a>
						<ul class="dropdown-menu">
							<li style="text-align: center"><a href="saveBoard" style="color: white">완료 게시판</a></li>
							<li style="text-align: center"><a href="tempBoard" style="color: white">임시저장 게시판</a></li>
							<li style="text-align: center"><a href="deleteBoard" style="color: white">삭제 게시판</a></li>
						</ul></li>
				</ul>
				<br>
			</div>
		</div>
	</div>




	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2 style="color: green">삭제된 게시물</h2>

				<div id="outter">

					<!-- 목록시작 -->

					<div class="card mb-12">
						<div class="card-header">
							<i class="fas fa-table mr-3"> 
							
							<!-- 검색 -->
								<div class="well form-search">
									<select name="searchType">
										<option value="t"
											<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
										<option value="w"
											<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									</select> <input type="text" name="keyword" id="keywordInput"
										value="${scri.keyword}" />

									<button id="searchBtn" type="button">검색</button>
									<script type="text/javascript">
										$(function() {
											$('#searchBtn')
													.click(
															function() {
																$
																		.ajax({
																			url : "SearchboardPage",
																			success : function(
																					result) {
																				var html = "";
																				result
																						.forEach(function(
																								item) {
																							html += "<tr> <td><a href = 'view?idx="
																									+ item.idx
																									+ "'>"
																									+ item.title
																									+ "</a>"
																									+ "</td> </tr>"
																						})
																				$(
																						"#listArea")
																						.append(
																								html)
																				$(
																						'#example')
																						.DataTable();
																			}
																		});
															});
										});
									</script>
								</div>
							</i>
						</div>
						<!-- 검색 끝-->


						<div class="card-body">
							<div class="table-responsive">

								<!-- 글갯수 옵션 -->
								<div style="float: right;">
									<select id="cntPerPage" name="sel" onchange="selChange()">
										<option value="5"
											<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
											보기</option>
										<option value="10"
											<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
											보기</option>
										<option value="15"
											<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
											보기</option>
										<option value="20"
											<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
											보기</option>
									</select>
								</div>
								<!-- 옵션선택 끝 -->


								<!-- 글목록 -->
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0" border="1">
									<tr>
										<td>No.</td>
										<td width="50%">제목</td>
										<td>작성자</td>
										<td>등록일</td>
										<td>조회수</td>
									</tr>
									<c:forEach items="${viewAll }" var="list">
										<tr>
											<td>${board.idx }</td>
											<td><a href='detail?seq=${board.idx }'>${board.title }</a>

												<!-- 복구 버튼 --> 
												<input type="button" class="btn btn-success"
												id="restoreBtn" value="글쓰기" style="float: right;"
												onclick="location.href='/restore'">
											
											</td>
											<td>${board.writer }</td>
											<td><fmt:formatDate value="${board.reg_date }"
													pattern="yyyy.MM.dd" /></td>
											<td>${board.cnt }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>

					<!-- 글쓰기 버튼 -->
					<div class="row">
						<div class="col">
							<div class="form-row float-right">
								<input type="button" class="btn btn-outline-info" id="writeBtn"
									value="글쓰기" onclick="location.href='/write'"><br>
							</div>
						</div>
					</div>



					<!-- 페이지네이션 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/boardPage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/boardPage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/boardPage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>


			</div>
		</div>
	</div>
	<footer class="footer">
		<p style="color: black; text-align: left;">
		<div
			style="width: 250px; height: 50px; float: left; margin-left: 430px; margin-right: 100px">
			<img class="sbdc" alt="SBDC" width="250" height="50" align="middle"
				hspace="50"
				src="https://www.sbdc.or.kr/assets/images/footer/footer-logo.png">
		</div>
		<div style="margin-left: 300px">
			<p style="text-align: left;">
				(07997) 서울특별시 양천구 목동동로 309 중소기업유통센터<br> 대표자 : 정진수 / 대표전화 :
				02-6678-9000 / 사업자등록번호 : 107-81-53660 <br> © Small & Medium
				Business Distribution Center. All Rights Reserved.
			</p>
		</div>
		</p>
	</footer>
</body>
</html>