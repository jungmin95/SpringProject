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
	<script type="text/javascript">
		function submitFunction() {
			var chatName = $('#chatName').val();
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "./chatSubmitServlet",
				data: {
					chatName : chatName,
					chatContent : chatContent
				},
				success: function(result) {
					if(result == 1) {
						autoClosingAlert('#successMessage', 2000);
					}else if(result == 0) {
						autoClosingAlert('#dangerMessage', 2000);
						console.log("기모띵~?");
						console.log("chatName =" +chatName);
						console.log("chatContent = " + chatContent);
					}else{
						autoClosingAlert('#warningMessage', 2000);
						}
				}
			});
			$('#chatContent').val('');
		}
		function autoClosingAlert(selector, delay) {
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() { alert.hide()}, delay);
		}
		
		function chatListFunction(type) {
			$.ajax({
				type: "POST",
				url: "./chatListServlet",
				data: {
					listType : type,
				},
				success: function(data) {
					console.log("기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ모ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ리")
					var parsed = JSON.parse(data);
					var result = parsed.result;
					console.log("긔모리ㅢㅇㅁㄹㅇㄴㄻㄴㅇ" + parsed + " " + result);
					console.log(result.length);
					for(var i = 0; i < result.length; i++) {
						addChat(result[i][0].value, result[i][1].value, result[i][2].value);
						console.log("addChat for문이 돌고있나요 ?" + i);
					}
				}
			});
		}
		function addChat(chatName, chatContent, chatTime) {
			console.log("add챗입니다용~~~~~~~~~~~~~~~~~~~~~")
			$('#chatList').append('<div class="row">' +
					'<div class="col-lg-12">' +
					'<div class="media">' +
					'<a class="pull-left" href="#">' +
					'<img class="media-object img-circle" src="images/icon.png" alt="">' +
					'</a>' +
					'<div class="media-body">' +
					'<h4 class="media-heading">' +
					chatName +
					'<span class="small pull-right">' +
					chatTime +
					'</span>' +
					'</h4>' +
					'<p>' +
					chatContent +
					'</p>' +
					'</div>' +
					'</div>' +
					'</div>' +
					'</div>' +
					'<hr>');

		}
	</script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList"class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height:300px;">
							
							</div>
									<div class="portlet-footer">
		<div class="row">
			<div class="form-group col-xs-4">
				<input style="height: 40px;" type="text" id="chatName" name="chatName" class="form-control" placeholder="이름" maxlength="8">
				
			</div>
	
	<div class="row">
		<div class="form-group col-xs-10">
			<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>		
		</div>
		<div class="form-group col-xs-2">
			<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
			<div class="clearfix"></div>
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
	
		<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메세지 전송에 성공하였습니다.</strong>
	</div>
		<div class="alert alert-danger" id="dangerMessage" style="display:none;">
		<strong>이름과 내용을 입력해주세요.</strong>
	</div>
		<div class="alert alert-warning" id="warningMessage" style="display:none;">
		<strong>데이터베이스 오류</strong>
	</div>
	<button type="button" class="btn btn-default pull-right" onclick="chatListFunction('today');">추가</button>
</body>
</html>