<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='utf-8' />
<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/resources/css/semantic.css">
<!--<link href='calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />-->
<script src='/resources/js/moment.min.js'></script>
<script src='/resources/js/jquery.min.js'></script>
<script src='/resources/js/jquery-ui.min.js'></script>
<script src='/resources/js/fullcalendar.min.js'></script>
<script src="/resources/js/semantic.js"></script>
<script src="/resources/js/locale-all.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>

        $(document).ready(function() {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var sendData = new Object();
			var memoEvent;
			var eventID;
			var isContents;
            $('#external-events .fc-event').each(function() {
                // store data so the calendar knows to render an event upon drop
               $(this).data('event', {
                   	
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick:true // true : next / prev 버튼 클릭 후 다시 제자리로 돌아왔을 때도 추가된 일정 그대로 남아 있음
                                // false: 없어짐.
                });
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag

                });
            });

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                defaultView: 'agendaDay',
                locale:'us',
                selectable: true,
                
                //사용자 지정 이벤트 등록.
                select: function(start, end, allDay){
                  var title = prompt('일정을 입력하세요');
                  if(title){
                	  	$.ajax({
                	  		dataType:"text",
                	  		type:"POST",
                	  		url:"/plan/UserPlanDetail",
                	  		data: JSON.stringify({
                   	   		planID:${planVO.planID},
                   	   		title:title,
                   	   	    planDetailDate:start
                   	   	 }),
                    	  	contentType: "application/json; charset=UTF-8",
                    	  	success: function(result){
                          	  	calendar.fullCalendar('renderEvent', {
                                    title: title,
                                    start:start,
                                    end:end,
                                    allDay:allDay,
                                    id:result
                                 }, true);
                    	  	}
                	  	});
  
                  }
                  calendar.fullCalendar('unselect');
                },
               
                defaultDate: ${date},
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                droppable: true,
                eventLimit: true, // allow "more" link when too many events,
                events: [
                ],
                
                //drop 발생 시, external-event로 부터 필요한 값을 읽어 전역변수 sendData에저장.
                drop: function(date) {
        	    	
                	sendData.planID = ${planVO.planID};
                	sendData.contentsID = this.id;
                	sendData.codeID = $(this).attr('name');
                },
                
                //drop시,event를 받아서 db에 저장.
                eventReceive: function(event) {
                	sendData.title = event.title;
                	sendData.dateAndTime = event.start.format();
               	
                	var jsonData = JSON.stringify(sendData);
                	console.log(jsonData);

                  $.ajax({
                	 	dataType:"text",
                	  	type:"POST",
                	  	url:"/plan/detailRegister",
                	  	data: jsonData,
                	  	contentType: "application/json; charset=UTF-8",
                	  	success: function(result){
                	  		event.id=result;
                	  		$('#calendar').fullCalendar('updateEvent', event);
                	  		alert(event.id);
                	  	}
                  }); 
                },
                
                //드래그 & 드롭으로 이벤트 시간 변경 시, 해당 이벤트의 db 시간 컬럼 업데이트.
                eventDrop: function(event) {
					var updateData = {};
					updateData.planDetailID = event.id;
					updateData.dateAndTime = event.start.format();
					var updateJson = JSON.stringify(updateData);
					
					$.ajax({
						type:"POST",
						url:"/plan/updatePlanDetail",
						data:updateJson,
						contentType: "application/json; charset=UTF-8",
                	  		success: function(result){
                	  		}
						
					});
               
                },

                
                eventRender: function(event, element) {
                    element.find('.fc-content').append( "<span class='memo'> ㅁ </span>" );
                    element.find('.fc-content').append( "<span class='closeon'> X </span>" );
                    //삭제
                    element.find(".closeon").click(function() {
                       $.ajax({
                    	   	 url:'/plan/deletePlanDetail',
                    	   	 type:"POST",
                    	   	 data:JSON.stringify({
                    	   		 planDetailID: event.id
                    	   	 }),
                    	   	contentType: "application/json; charset=UTF-8",
                    	   	success:function(result){}
                    	   	 
                       });
                        $('#calendar').fullCalendar('removeEvents',event.id);
                    });

                    //메모
                    element.find(".memo").click(function(){                   
                    		eventID= event.id;
                    		$.ajax({
                    			url:"/plan/selectMemo",
                    			type:"POST",
                    			data:JSON.stringify({
                    				planDetailID:eventID
                    			}),
                    			async:true,
                    			dataType:"json",
                    			contentType:"application/json; charset=UTF-8",
                    			success:function(result){
                    				isContents = result.memoVO.memoContents;
                    				console.log(isContents);
                    				$('textarea').val(isContents);
                    				
                    				//받아온 사진 있으면 조회해서 uploadedList에 뿌려주
                    				var template = Handlebars.compile($('#templateAttach').html());
                    				$(result.memoVO.memoPictures).each(function(){
                    					var fileInfo = getFileInfo(this);
                    					var html = template(fileInfo);
                    					$(".uploadedList").append(html);
                    				});
                    				
                    				console.log(result);
                    				$('.ui.modal').modal('show');
                                 $('.ui.modal').modal({backdrop: 'static'});
                    			}
                    		});
                        

                    });
                    
                    
                }


            });
            
            //메모 등록 버튼.
            $("#registerMemoBtn").click(function(){
            	var url;
            	console.log("register isContents:"+isContents);
            	if(isContents == null){
            		url = "/plan/registerMemo";
            	}else{
            		url = "/plan/modifyMemo";
            	}
                $.ajax({
                		url:url,
                		type:"POST",
                		dataType:"text",
                		contentType: "application/json; charset=UTF-8",
                		data: JSON.stringify({
                   	   		planDetailID:eventID,
                   	   		memoContents:$('textarea').val()
                   	   	 }),
                	   	success:function(result){
                	   	}
                });
            });
            
            $("#deleteMemoBtn").click(function(){
            		$('.uploadedList').empty();
            });
        });
    </script>
<style>
body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	float: right;
	width: 900px;
}

.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>



</head>
<body>
	<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event' id=1 name=1>한글이</div>
			<div class='fc-event' id="2" name=1>My Event 2</div>
			<div class='fc-event' id="3" name=1>My Event 3</div>
			<div class='fc-event' id="4" name=2>My Event 4</div>
			<div class='fc-event' id="5" name=2>My Event 5</div>
		</div>

		<div id='calendar'></div>
		<div style='clear: both'></div>
	</div>

	<div class="ui modal">
		<i class="close icon"></i>
		<div class="header">Memo</div>
		<div class="description">
			<div class="ui header">내용</div>
			<textarea rows="10" cols="100" name=></textarea>
			<div class="form-group">
				<div class="ui header">사진</div>
				<label for="exampleInputEmail1">File DROP Here</label>
				<div class="fileDrop"></div>
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
		</div>
		<div class="actions">
			<c:if test="${isContents != null}">
				<button class="ui negative right labeled icon button"
					id="deleteMemoBtn">DELETE</button>
			</c:if>
			<button class="ui positive right labeled icon button"
				id="registerMemoBtn">SAVE</button>
		</div>

	</div>
	<button class="ui positive right labeled icon button" id="registerPlan">
		SAVE</button>

	<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
   <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
   </span>
  </div>
</li>                
</script>


	<script id="template" type="text/x-handlebars-template">
<li>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="{{imgsrc}}"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove">x</i></a>
	</div>
</li>
</script>

	<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
	
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
	
		var formData = new FormData();
	
		formData.append("file", file);
	
		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
	
				$(".uploadedList").append(html);
			}
	
		});
	});
</script>
</body>

</html>