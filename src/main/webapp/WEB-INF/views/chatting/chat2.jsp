<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/chat.css">
<title>AJAX 실시간 채팅 사이트</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="containber bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅 방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2017년 5월 30일</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="{imgages/icon.png">
											
											</a>
											<div class="media-body">
												<h4 class="media-heading">홍길동
												<span class="small pull-right">오전 12:23</span>
												</h4>
											</div>
											<p>안녕하세요 오랜만입니다 홍길동입니다.</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
								<div class="col-lg-12">
									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object img-circle" src="{imgages/icon.png">
											
										</a>
										<div class="media-body">
											<h4 class="media-heading">이순신
											<span class="small pull-right">오후 12:28</span>
											</h4>
										</div>
										<p>저도 반가워요</p>
									</div>
								</div>
								</div>
	<div class="portlet-footer">
		<div class="row">
			<div class="form-group col-xs-4">
				<input style="height:40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20"></input>
			</div>
		</div>
	</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>