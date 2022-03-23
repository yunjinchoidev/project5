<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	.input-group-text{width:100%;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>




<script type="text/javascript">
	var wsocket;
	var theSrc;
	var myFaceData;
	var theSrc;
	
	$(document).ready(function(){
		
		playAlert = setInterval(function() {
			console.log("ggg")
			theSrc(myFaceData.fname)
		}, 1000);
		
		var theSrc =  function showImg2(fname){
		    var uploadUL = $(".myFace");
		    var fileCallPath =  encodeURIComponent(fname);
		    var theSrc = '/project5/display2.do?fileName='+fileCallPath
		    $(".myFace").attr("src",theSrc)
		  }
		
		
		
		var memberkey = parseInt("${member.memberkey}");
		var data = {memberkey : memberkey}
					
		
					$.ajax({
						url : '/project5/myfaceData.do',
						method : 'POST',
						async:false,
						data : data,
						dataType:'json',
						success:function(result){
							console.log(result)
							console.log(result.myfaceData)
							console.log(result.myfaceData[0].fname)
							console.log("myfaceData 불러오기 성공")
							//showImg(result.myfaceData[0].fname)
							myFaceData = result.myfaceData[0];
							theSrc(myFaceData.fname)
						},
						error:function(result){
							console.log("myfaceData 불러오기 실패")
						}
					})
		
						console.log("====================")
						console.log("내 얼굴 이미지 " +myFaceData)
		
					  function showImg(fname){
					    var uploadUL = $(".myFace");
					    var fileCallPath =  encodeURIComponent(fname);
					    var theSrc = '/project5/display2.do?fileName='+fileCallPath
					    $(".myFace").attr("src",theSrc)
					  }
					
					
				
					
					theSrc(myFaceData.fname)

		

						//////////////////////////////////////////////////////////////////////////////

						// 1. 웹 소켓 클라이언트를 통해 웹 서버 연결하기.
						$("#enterBtn").click(function() {
							conn();
						});

						$("#id").keyup(function() {
							if (event.keyCode == 13) {
								conn();
							}
						})

						
						
						// 메시지 보내기
						$("#msg").keyup(function() {
							if (event.keyCode == 13) {
								sendMsg();
							}
							
							var message = $("#msg").val();
							var data = {message : message};
							$.ajax({
								url:'/project5/createMessage.do'
							})
							
							
						});
						$("#sendBtn").click(function() {
							sendMsg();
						});

							// 접속 종료를 처리했을 시
							$("#exitBtn").click(
								function() {
									wsocket.send("msg:" + $("#id").val()
											+ ":접속 종료 했습니다!");
									wsocket.close();
								});

						////////////////////////////////////////////////////////////////////////
						// 메시지는 보내는 기능 메서드
						function sendMsg() {
							var id = $("#id").val();
							var msg = $("#msg").val();
							// message를 보내는 처리..서버의 handler의  handleTextMessage()와 연동
							//wsocket.send("msg:"+id+":"+msg);
							var str = "";
							str += "<div class='chat-message-right pb-4'>"
							str += "<div>"
							str += "<img src='https://bootdey.com/img/Content/avatar/avatar1.png' class='rounded-circle mr-1 myFace' alt='Chris Wood' width='40' height='40'>"
							str += "<div class='text-muted small text-nowrap mt-2'>2:33 am</div>"
							str += "</div>"
							str += "<div class='flex-shrink-1 bg-light rounded py-2 px-3 mr-3'>"
							str += "<div class='font-weight-bold mb-1'>"
									+ $("#id").val() + "</div>"
							str += msg
							str += "</div>"
							str += "</div>"
							console.log("메시지 보내기 :::::::::::::::" + str);
							wsocket.send("msg:" + str);
							$("#msg").val("");
							$("#msg").focus();
						}
					});

	
	
	
	function conn() {
		wsocket = new WebSocket("ws:/106.10.16.155:7080/${path}/chat-ws.do");
		// handler :afterConnectionEstablished(WebSocketSession session)와 연결
		wsocket.onopen = function(evt) {
			console.log(evt);
			var str = "";
			str += "<div class='chat-message-right pb-4'>"
			str += "<div>"
			str += "<img src='#' class='rounded-circle mr-1 myFace' alt='Chris Wood' width='40' height='40'>"
			str += "<div class='text-muted small text-nowrap mt-2'>2:33 am</div>"
			str += "</div>"
			str += "<div class='flex-shrink-1 bg-light rounded py-2 px-3 mr-3'>"
			str += "<div class='font-weight-bold mb-1'>" + $("#id").val()
					+ "</div>"
			str += "상담을 시작합니다."
			str += "</div>"
			str += "</div>"
			console.log(str);
			
			// 상담원
			var str2 = "";
			str2 += "<div class='chat-message-left pb-4'>"
			str2 += "<div>"
			str2 += "<img src='https://bootdey.com/img/Content/avatar/avatar3.png' class='rounded-circle mr-1' alt='Chris Wood' width='40' height='40'>"
			str2 += "<div class='text-muted small text-nowrap mt-2'>2:33 am</div>"
			str2 += "</div>"
			str2 += "<div class='flex-shrink-1 bg-light rounded py-2 px-3 mr-3'>"
			str2 += "<div class='font-weight-bold mb-1'>상담원 A</div>"
			str2 += "안녕하세요?" + $("#id").val() + ", 무엇을 도와드릴까요?"
			str2 += "</div>"
			str2 += "</div>"

			wsocket.send("msg:" + str);
			wsocket.send("msg:" + str2);
		}

		// handler의  handleTextMessage()
		// 연결되어 있으면 메시지를 push형식으로 서버에서 받을 수 있다.
		// ex) wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다!");
		// push 방식으로 서버에서 전달되어 온 데이터를 받게 처리..
		wsocket.onmessage = function(evt) {
			// 받은 데이터
			var msg = evt.data;
			// msg 내용 삭제 후, 처리
			if (msg.substring(0, 4) == "msg:") {
				// 메시지 내용만 전달
				// 메시지 내용 scrolling 처리..
				var revMsg = msg.substring(4)
				$("#chatMessageArea").append(revMsg + "<br>");
				// 1. 전체 chatMessageArea의 입력된 최대 높이 구하기..
				var mx = parseInt($("#chatMessageArea").height())
				// 2. 포함하고 있는 div의 scrollTop을 통해 최하단의 내용으로 scrolling 하기..
				//    chatArea
				$("#chatArea").scrollTop(mx);
			}
		}

		// handler의 afterConnectionClose와 연동
		wsocket.onclose = function() {
			alert($("#id").val() + '접속 종료합니다.')
			$("#chatMessageArea").text("");
			$("#id").val("");
			$("#id").focus();
		}

	}
</script>
<style>
body{margin-top:20px;}

.chat-online {
    color: #34ce57
}

.chat-offline {
    color: #e4606d
}

.chat-messages {
    display: flex;
    flex-direction: column;
    max-height: 800px;
    overflow-y: scroll
}

.chat-message-left,
.chat-message-right {
    display: flex;
    flex-shrink: 0
}

.chat-message-left {
    margin-right: auto
}

.chat-message-right {
    flex-direction: row-reverse;
    margin-left: auto
}
.py-3 {
    padding-top: 1rem!important;
    padding-bottom: 1rem!important;
}
.px-4 {
    padding-right: 1.5rem!important;
    padding-left: 1.5rem!important;
}
.flex-grow-0 {
    flex-grow: 0!important;
}
.border-top {
    border-top: 1px solid #dee2e6!important;
}
</style>
</head>

<body>

<%@ include file="../common/header.jsp"%>



	<div id="main">

		<div class="page-heading">
			<div class="page-title">
				<div class="row">

					<%@ include file="../projectHome/sort.jsp"%>






					<div class="col-12 col-md-6 order-md-1 order-last">
						<span style="font-size: 40px; font-weight: bolder; color: red;">고객 상담
						</span> <span style="font-size: 40px; font-weight: bolder; color: black;">홈</span>
						<p class="text-subtitle text-muted">고객 상담을 확인하십시오.</p>
					</div>

					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">DataTable</li>
							</ol>
						</nav>
					</div>

				</div>


			</div>
			
			
			
			<section class="section">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">

							<div class="dataTable-top">
								<div class="dataTable-search">
								</div>
							</div>
							<div class="dataTable-container">
							
											

							<main class="content" style=" margin-top: 40px;">
							    <div class="container p-0">
							
									<h1 class="h3 mb-3">고객상담</h1>
									
									<input class="dataTable-input" placeholder="${member.name }님" value="${member.name }님" type="text"  id="id"> 
										<a class="btn btn-danger"  id="enterBtn" style="color:white">상담 시작</a> 
										<a class="btn btn-info" id="exitBtn"  style="color:white">종료</a> 
										<br>
									
							
									<div class="card" style="height: 1000px; border: 1px solid black; margin-top: 30px;">
										<div class="row g-0">
											<div class="col-12 col-lg-5 col-xl-3 border-right">
							
												<div class="px-4 d-none d-md-block">
													<div class="d-flex align-items-center">
														<div class="flex-grow-1">
															<input type="text" class="form-control my-3" placeholder="Search...">
														</div>
													</div>
												</div>
							
												<a href="#" class="list-group-item list-group-item-action border-0">
													<div class="badge bg-success float-right">$$$$</div>
													<div class="d-flex align-items-start">
														<img src="https://bootdey.com/img/Content/avatar/avatar5.png" class="rounded-circle mr-1" alt="Vanessa Tucker" width="40" height="40">
														<div class="flex-grow-1 ml-3">
															홍길동
															<div class="small"><span class="fas fa-circle chat-online"></span> 온라인</div>
														</div>
													</div>
												</a>
												
							
												<hr class="d-block d-lg-none mt-1 mb-0">
											</div>
											<div class="col-12 col-lg-7 col-xl-9">
											
												<div class="py-2 px-4 border-bottom d-none d-lg-block">
													<div class="d-flex align-items-center py-1">
														<div class="position-relative">
															<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
														</div>
														<div class="flex-grow-1 pl-3">
															<strong>상담원1</strong>
															<div class="text-muted small"><em>Typing...</em></div>
														</div>
														<div>
															<a class="btn btn-info" style="color:white">추천하기</a> 
															<a class="btn btn-danger" style="color:white">신고하기</a> 
															<a class="btn btn-secondary" style="color:white">건의하기</a> 
														</div>
													</div>
												</div>
							
							
							
							
							
							
							
							
												<div class="position-relative">
													<!--  조심 -->
													<div class="chat-messages p-4" id="chatMessageArea" style="height: 1000px;">
													
													
														<!--  오른쪽 말풍선 -->
														<div class="chat-message-right pb-4">
															<div>
																<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1 myFace" alt="Chris Wood" width="40" height="40">
																<div class="text-muted small text-nowrap mt-2">2:33 am</div>
															</div>
															<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
																<div class="font-weight-bold mb-1">You</div>
																Lorem ipsum dolor sit amet, vis erat denique in, dicunt prodesset te vix.
															</div>
														</div>
										
														<!--  상담원 말풍선 -->
														<div class="chat-message-left pb-4">
															<div>
																<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1 consultantFace" alt="Sharon Lessman" width="40" height="40">
																<div class="text-muted small text-nowrap mt-2">2:34 am</div>
															</div>
															<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
																<div class="font-weight-bold mb-1">Sharon Lessman</div>
																Sit meis deleniti eu, pri vidit meliore docendi ut, an eum erat animal commodo.
															</div>
														</div>
														
														
														
														
														
														
														
													</div>
												</div>
												<div class="flex-grow-0 py-3 px-4 border-top">
													<div class="input-group">
														<input type="text" class="form-control" placeholder="Type your message" id="msg" >
														<button class="btn btn-primary"  id="sendBtn">전송</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</main>
								

							










							</div>






						</div>
					</div>
				</div>
			</section>
		</div>

	</div>


</body>
</html>