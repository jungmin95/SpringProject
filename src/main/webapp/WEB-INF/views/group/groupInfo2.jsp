<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
<meta name="author" content="Ansonika">
<title>그룹정보</title>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- Favicons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="/resources/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="/resources/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="/resources/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="/resources/img/apple-touch-icon-144x144-precomposed.png">

<!-- Google web fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i"
	rel="stylesheet">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

<!-- Radio and check inputs -->
<link href="${pageContext.request.contextPath }/resources/css/skins/square/grey.css" rel="stylesheet">

<style type="text/css">
img {
	display: block;
	max-width: 300px;
	max-height: 200px;
	width: auto;
	height: auto;
}

/* .fouc { */
/* 	display: none; */
/* } */
.myButton {
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	background-color:#3d94f6;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
.myButton:hover {
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	background-color:#1e62d0;
}
.myButton:active {
	position:relative;
	top:1px;
}
pager>ul.li:active {
	background-color:black;
	color: black;
}
.pager li.active>a{
	background-color:black;
	color: black;
}
</style>


<style>

ul>li:hover>a, ul>li:focus>a, ul>li:active>a, ul>li.active>a {
	color: yellow;
	background-color: #000;
}
</style>



</head>

<body>
	<%@ include file="../common/header.jsp" %>
	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>GroupInfo page</h1>
			</div>
		</div>
	</section>
	<main>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><a href="${pageContext.request.contextPath }/group/GroupList.do">게시판 목록 </a></li>

				<li><b>그룹상세</b></li>
			</ul>
		</div>
	</div>
		
		<!-- End position -->

		<div class="container margin_60">
			<div class="row">

				<!-- START group side form -->
<!--  기준 -->

			<aside class="col-md-4" id="sidebar">
				<div class="theiaStickySidebar">
					<div class="box_style_1" id="booking_box">
					

					
						<h3 class="inner">${groupDetail.grouplist_name}</h3>
						<img width="auto" height="auto"
							src="${pageContext.request.contextPath }/resources/upload/${groupDetail.grouplist_photo}"
							alt="Image">
						<hr>
						<div class="form-inline">
							<p>키워드 ${groupDetail.grouplist_interest}</p>

							<p>${groupPeopleCount } / ${groupDetail.grouplist_people} (현재원 / 총원)</p>
						</div>
						<p>생성일 ${groupDetail.grouplist_date}</p>
						<hr>
						<p>${groupDetail.grouplist_introduce}</p>
						<c:choose>
							<c:when
								test="${loginMap.member_group1 eq groupDetail.grouplist_number || loginMap.member_group2 eq groupDetail.grouplist_number || loginMap.member_group3 eq groupDetail.grouplist_number}">
								<button style="width:100%;" class="myButton" value="${groupDetail.grouplist_number }">이미 가입된
									모임입니다.</button>
							</c:when>
							<c:when test="${groupPeopleCount eq groupDetail.grouplist_people}">
								<button class="myButton" onclick="javascript:goList();">풀방입니다</button>
							</c:when>
							<c:when
								test="${loginMap.member_group1 ne groupDetail.grouplist_number || loginMap.member_group2 ne groupDetail.grouplist_number || loginMap.member_group3 ne groupDetail.grouplist_number}">
								<c:choose>
									<c:when test="${loginMap.member_id eq null}">
										<button class="myButton" onclick="javascript:goLogin();" value="${loginMap.member_id eq null }">로그인해주세요</button>
									</c:when>
									<c:when test="${groupPeopleCount eq groupDetail.grouplist_people}">
										<button class="myButton" onclick="javascript:goList();">풀방입니다</button>
									</c:when>
									<c:when test="${loginMap.member_id ne null }">
										<button class="myButton" onclick="javascript:goGroupJogin();" value="${groupDetail.grouplist_number }">가입신청</button>
									</c:when>						
								</c:choose>
							</c:when>
						</c:choose>
					</div>
				</div>
			
				<!--End sticky -->	
			</aside>

			<!-- END group side form -->


			<!-- START group tab -->
			<div class="col-md-8 add_bottom_15">
				<form id="groupForm" name="groupForm" method="post">
					<div class="row">
						<div class="col">
							<p></p>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="board-tab" data-toggle="tab" role="tab" href="#board"
									role="tab" aria-controls="board" aria-selected="true">게시판</a></li>
								<li class="nav-item"><a class="nav-link" id="gallery-tab"
									data-toggle="tab" role="tab" href="#gallery"
									aria-controls="gallery" aria-selected="false">사진첩</a></li>
								<li class="nav-item"><a class="nav-link" id="member-tab"
									data-toggle="tab" role="tab" href="#member"
									aria-controls="member" aria-selected="false">모임회원</a></li>
								<li class="nav-item"><a class="nav-link" id="somoim-tab"
									data-toggle="tab" role="tab" href="#somoim"
									aria-controls="somoim" aria-selected="false">소모임</a></li>
							</ul>
							<div class="tab-content fouc" id="myTabContent">


								<!-- START group BOARD TAB -->

								<div class="tab-pane fade active" id="board"
									role="tabpanel" aria-labelledby="board-tab">
									<div class ="main-title">
											<table class="table table-striped table-hover" style="table-layout: fixed">
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>내용</th>
														<th>작성자</th>
														<th>날짜</th>
														<th>조회수</th>
													</tr>
												</thead>
											<tbody>
													<c:forEach var="boardList" items="${boardList }" varStatus="status">
														<tr>
														<!-- 테스ㅋ트 -->
															<td><c:out value="${boardList.row_number}"></c:out></td>
															<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href="${pageContext.request.contextPath }/boardDetail.do?groupList_number=${groupDetail.grouplist_number}&board_number=${boardList.board_number }"><c:out value="${boardList.board_title }"/></a></td>
															<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><c:out value="${boardList.board_content }"/></td>
															<td><c:out value="${boardList.board_writer }"/></td>
															<td><c:out value="${boardList.board_date }"/></td>
															<td><span class="badge bg-red">${boardList.board_count }</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										   <div style = "text-align: right;">           
          									  <input type="button" onclick="goCreate('${loginMap.member_id}')" value="글쓰기" class="btn btn-success" >
     									   </div>
										</div>
								<div class="text-center">
										<ul class="pager">

											<c:if test="${boardPageMaker.prev }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${boardPageMaker.startPage-1 }#board"/>'>
														Previous </a></li>
											</c:if>
											<c:forEach begin="${boardPageMaker.startPage }"
												end="${boardPageMaker.endPage }" var="idx" varStatus="status">
												
												<li><a id="boardPage" name="boardPage" 
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${idx }#board"/>'>
													
													<i class="fa">${idx }</i></a></li>
											</c:forEach>
											<c:if test="${boardPageMaker.next && boardPageMaker.endPage > 0 }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${boardPageMaker.endPage+1 }#board"/>'>
														Next </a></li>
											</c:if>
										</ul>
									</div>


								</div>
								<!-- END group BOARD TAB -->


								<!-- START group GALLERY TAB -->
								<div class="tab-pane fade" id="gallery" role="tabpanel" aria-labelledby="gallery-tab">

									<hr>
									<div class="text-right">
										<c:if test="${loginMap.member_id == null}">
											<input type="button" class="btn_1"
												onclick="upload_btn(${loginMap.member_id})" value="사진 등록" />
										</c:if>
										<c:if test="${loginMap.member_id != null }">
											<a
												href="${pageContext.request.contextPath }/upload.do?groupList_number=${groupDetail.grouplist_number}"
												class="btn_1">사진 등록</a>
										</c:if>
									</div>
									<br>

									<div class="row">
										<c:forEach items="${galleryList}" var="galleryList">

											<div class="col-lg-4 col-md-4 col-sm-4">
												<div class="img_container_gallery"
													style="width: 200px; height: 200px;">
													<a
														href="${pageContext.request.contextPath }/galleryDetail.do?num=${galleryList.num}">
														<img
														src="${pageContext.request.contextPath }/resources/upload/${galleryList.photo_name}"
														alt="Image" style="width:200px; height:180px;">

													</a>

												</div>

											</div>
										</c:forEach>
									
									</div>
									<hr>
									<div class="text-center">
										<ul class="pagination">

											<c:if test="${pageMaker.prev }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.startPage-1 }#gallery"/>'>
														Previous </a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx" varStatus="status">

												<li><a id="page" name="page" 
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${idx }#gallery"/>'>
													
													<i class="fa">${idx }</i></a></li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.endPage+1 }#gallery"/>'>
														Next </a></li>
											</c:if>
										</ul>
									</div>
									<!-- End row -->



									<!-- End container -->


								</div>

								<!-- End main -->


								<div id="toTop" style="display: none;"></div>
								<!-- Back to top button -->

								<!-- Search Menu -->
								<div class="search-overlay-menu">
									<span class="search-overlay-close"><i
										class="icon_set_1_icon-77"></i></span>
									<form role="search" id="searchform" method="get">
										<input value="" name="q" type="search" placeholder="Search...">
										<button type="submit">
											<i class="icon_set_1_icon-78"></i>
										</button>
									</form>
								</div>
								<!-- END group GALLERY TAB -->

								<!-- START group MEMBER TAB -->
								<div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab">
									<table class="table table-striped options_cart">
											<thead>
												<tr>
													<th colspan="3">
														모임회원 목록
													</th>
												</tr>
											</thead>
										<c:forEach var="groupMemberList" items="${groupMemberList }" varStatus="status">					
											
											<tbody>
												<tr>
													<td class="col-md-3">
														<img src="${pageContext.request.contextPath }/resources/userupload/${groupMemberList.fileName }" class="mx-auto d-block" style="width:50%">
													</td>
													<td>
														<div class="col-md-6">
															<b>회원ID&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_id }"></c:out>
														</div>
														<div class="col-md-6">
															<b>학부&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_department }"></c:out>
														</div>
														<br><br>
														<div class="col-md-6">
															<b>학번&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_studentId }"></c:out>
														</div>
														<div class="col-md-6">
															<b>이름&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_name }"></c:out>
														</div>
													</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
								<!-- END group MEMBER TAB -->

								

								<!-- START group SOMOIM TAB -->
								<div class="tab-pane fade" id="somoim" role="tabpanel" aria-labelledby="somoim-tab">
									<!-- <table class="table table-striped options_cart"> -->
									<div class ="main-title">
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>번호</th>
													<th>소모임명</th>
													<th>개설일</th>
													<th>개설자</th>
												</tr>
											</thead>
											
											<tbody>
												<c:forEach var="smallGroupList" items="${smallGroupList }" varStatus="status">
													<tr>
														<td><c:out value="${smallGroupList.somoim_number }"/></td>
														<td><a href="${pageContext.request.contextPath }/somoimDetail.do?groupList_number=${groupDetail.grouplist_number}&somoim_number=${smallGroupList.somoim_number }#mapView"><c:out value="${smallGroupList.somoim_name }"/></a></td>
														<td><c:out value="${smallGroupList.somoim_name }"/></td>
														<td><c:out value="${loginMap.member_name }"/></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div style = "text-align: right;">           
											<a href='#' onclick="javascript:goCreateSomoim();" class="btn btn-success">개설하기</a>
										</div>
									</div>
									<div class="text-center">
										<ul class="pagination">
											<c:if test="${boardPageMaker.prev }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${boardPageMaker.startPage-1 }#board"/>'>
														Previous </a>
												</li>
											</c:if>
											<c:forEach begin="${boardPageMaker.startPage }"
												end="${boardPageMaker.endPage }" var="idx" varStatus="status">
										
												<li><a id="boardPage" name="boardPage" 
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${idx }#board"/>'>
													
													<i class="fa">${idx }</i>
													</a>
												</li>
											</c:forEach>
											<c:if test="${boardPageMaker.next && boardPageMaker.endPage > 0 }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&boardPage=${boardPageMaker.endPage+1 }#board"/>'>
														Next </a>
												</li>
											</c:if>
										</ul>
									</div>
									<!-- </table> -->
								</div>
								<!-- END group SOMOIM TAB -->

							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- END group tab -->
			<!--End col-md-8 -->


		</div>
		<!--End row -->
	</div>
	<!--End container --> 
	
	</main>
	<!-- End main -->

	<%@ include file="../common/footer.jsp"%>

	<div id="toTop"></div>
	<!-- Back to top button -->

	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i
			class="icon_set_1_icon-77"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search..." />
			<button type="submit">
				<i class="icon_set_1_icon-78"></i>
			</button>
		</form>
	</div>
	<!-- End Search Menu -->

	<!-- Jquery -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-2.2.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/common_scripts_min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/functions.js"></script>

	<script src="${pageContext.request.contextPath }/resources/js/icheck.js"></script>
	
	<script>
		$('input').iCheck({
			checkboxClass: 'icheckbox_square-grey',
			radioClass: 'iradio_square-grey'
		});
	</script>

	<!-- Fixed sidebar -->
	<script src="${pageContext.request.contextPath }/resources/js/theia-sticky-sidebar.js"></script>
	
	<script>
		jQuery('#sidebar').theiaStickySidebar({
			additionalMarginTop: 80
		});
	</script>
	
	<script>
 		$(function(){
 		 var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
 		
			 sBtn.find("a").click(function(${idx}){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	  		 sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	  		 $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
					
	  		});
			
 		});
</script>
<script>

	$("#page").trigger("click");
</script>
	<script>
	function upload_btn(id) {
			alert("로그인을 해주세요");
			location.href="/login.do";
	}
	</script>

	<script>
	function goCreate(member_id) {
		/* var member_id = ${loginMap.member_id}; */
		console.log(member_id);
		if(member_id == null) {
			alert("로그인을 해주세요" + member_id);
			location.href="/login.do";
		}else{
			alert("있다");
		 location.href="/boardWrite.do?groupList_number=${groupDetail.grouplist_number}";
		}
	}
	</script>
	<script>
	function goLogin() {
		location.href="/login.do";
	}
	
	function goList() {
		location.href="${pageContext.request.contextPath }/group/GroupList.do"
	}
	function goGroupJogin() {
		location.href="/group/groupJoin.do?groupList_number=${groupDetail.grouplist_number}&member_id=${loginMap.member_id}";
		
	}

	function goCreateSomoim() {
		location.href="/smallGroup.do?groupList_number=${groupDetail.grouplist_number}";
	}
	
	
	$(document).on('click', '#btnSearch', function(e){
	   e.preventDefault();
	   var url = "${requestScope['javax.servlet.forward.servlet_path']}";
	   url = url + "?searchType=" + $('#searchType').val();
	   url = url + "&keyword=" + $('#keyword').val();
	   location.href = url;
	   console.log(url);
	});
	
/*  	$('#myTab a[href="#board"]').tab('show') // Select tab by name
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  e.target // newly activated tab
		 
		})
 */
 
	$('#myTab a').click(function(e) {
	  e.preventDefault();
	  $(this).tab('show');
	});

	// store the currently selected tab in the hash value
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
	  var id = $(e.target).attr("href").substr(1);
	  window.location.hash = id;
	});

	// on load of the page: switch to the currently selected tab
	var hash = window.location.hash;
	$('#myTab a[href="' + hash + '"]').tab('show');
	</script>
	
	<!-- Modal script -->
	
</body>

</html>
