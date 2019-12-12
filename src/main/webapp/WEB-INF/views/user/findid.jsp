<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND ID</title>
    <link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Findid Page</h1>
			</div>
		</div>
	</section>
	<section>
		<div class="container">

							<div class="row">
								<div class="hr_style"></div>
								
								<!-- 수정 부분 -->
								<div class="col-xs-12">
									<h3 class="text-center col-md-offset-4 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12" style="color:#0E81C1;">아이디 찾기</h3>
								</div>
								<div class="descrip col-md-offset-4 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12">									
									<div class="text-content-font col-md-12 col-sm-12 col-xs-12 text-left" style="padding:0 0 30px 0;">
											<b>백석소모임 가입 시 사용하신 이메일을 입력하시면 보안코드를 보내드립니다.</b>
									</div>

									<form action="/findid/findid_02" method="post">

										<div class="col-md-12 col-sm-12 text-center" style="padding: 0px; margin: 0px;" >
											<div class="text-center">
												<div class="col-md-12 col-sm-12 text-center" style="padding: 0px;" >
													<input type="text" class="email_input col-md-12" id="email" name="email" placeholder="이메일을 입력해 주세요."><br>
												</div>
											</div>
										</div>
										<div class="col-md-12 col-sm-12 text-center" style="padding: 0px; margin: 0 0 10px 0;">
											
											<button type="submit" class="btn btn-default col-md-12"><span class="text-white">확인</span></button>
										</div>
									</form>
									<!-- form = /findid/findid_02 -->
									<!-- type=submit() -->
								</div>
								<!-- END -->
								
							</div>

		</div>
	</section>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>