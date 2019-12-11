<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="resources/FullCalendar_Example/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resources/FullCalendar_Example/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='resources/FullCalendar_Example/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resources/FullCalendar_Example/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="resources/FullCalendar_Example/css/main.css">
<style>
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 900px;
  margin: 40px auto;
}
</style>
</head>

<body>
<%@ include file="../common/header.jsp" %>

    <div class="container">
	
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
               
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>
		<div class="container">
        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
		
		</div>
		<div class="container">
        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
						<div class="col-xs-12">
                                <label class="col-xs-4" for="member_id">작성자</label>
                                <input type="text" id="member_id" name="member_id" value="${loginMap.member_id }" /></h5>
                            </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

      
    </div>
    <!-- /.container -->
      <%@ include file="../common/footer.jsp" %>
<script>
   $(document).ready(function() {
      fn_get_events();
   });

   function fn_set_calendar(map){
      $('#calendar').fullCalendar({
         events: map,    
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
         },
         editable: true,
         droppable: true, // this allows things to be dropped onto the calendar
         drop: function() {
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
              // if so, remove the element from the "Draggable Events" list
              $(this).remove();
            }
         }
         
        });
      calendar.addEvent(map);
   }
      
   function fn_get_events()
   {
       $.ajax({
            type: "get",
            url: "calTest.do",
            data: {
              // 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
               "member_id": $('#member_id').val()
            },
            success: function(map){
               fn_set_calendar(map);
            }
      }); 
   }
</script>



    <script src="resources/FullCalendar_Example/vendor/js/jquery.min.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/bootstrap.min.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/moment.min.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/fullcalendar.min.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/ko.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/select2.min.js"></script>
    <script src="resources/FullCalendar_Example/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/FullCalendar_Example/js/main.js"></script>
    <script src="resources/FullCalendar_Example/js/addEvent.js"></script>
    <script src="resources/FullCalendar_Example/js/editEvent.js"></script>
    <script src="resources/FullCalendar_Example/js/etcSetting.js"></script>
    
    
</body>

</html>