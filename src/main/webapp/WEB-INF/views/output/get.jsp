<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="main">
		<section id="multiple-column-form">
			<div class="row match-height">
				<div class="col-12">
					<div class="card">

						<div class="card-header">
							<h4 class="card-title">산출물 조회</h4>
						</div>

						<div class="card-content">
							<div class="card-body">

								<form class="form" action="/project5/projectHomeWrite.do">
									<input type="hidden" name="memberkey"
										value="${member.memberkey }">
									<div class="row">


										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="last-name-column">제목</label> <input type="text"
													id="last-name-column" class="form-control"
													placeholder="Last Name" name="title" value="${get.title }"
													readonly="readonly">
											</div>
										</div>



										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="first-name-column">프로젝트</label> <input
													type="text" value="${get.pname }" id="first-name-column"
													class="form-control" name="pname" readonly="readonly">
											</div>
										</div>

										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="first-name-column">작업 구분</label> <input
													type="text" value="${get.worksortTitle }"
													id="first-name-column" class="form-control"
													name="workSortkey" readonly="readonly">
											</div>
										</div>

										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="first-name-column">부서 구분</label> <input
													type="text" value="${get.dname }" id="first-name-column"
													class="form-control" name="dname" readonly="readonly">



											</div>
										</div>







										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="first-name-column">상황</label> <input type="text"
													value="${get.status }" id="first-name-column"
													class="form-control" name="status" readonly="readonly">
											</div>
										</div>









										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="city-column">작성일 ${list.writedate}</label> <input
													type="text" id="city-column" class="form-control"
													placeholder="writedateS" name="writeDateS"
													value='<fmt:formatDate value="${get.writedate }" />'
													readonly="readonly">


											</div>
										</div>







										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="email-id-column">버전</label> <input type="text"
													id="email-id-column" class="form-control"
													placeholder="memberkey" name="version"
													value="${get.version }" readonly="readonly">
											</div>
										</div>


										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="email-id-column">작성자</label> <input type="text"
													id="email-id-column" class="form-control"
													placeholder="memberkey" value="${member.name }"
													readonly="readonly">
											</div>
										</div>









									</div>
									<div class="row">
										<div class="col-md-6 col-12" style="width: 100%">
											<div class="form-group">
												<label for="email-id-column">Contents</label>
												<textarea class="form-control" name="contents"
													placeholder="Contents" rows="6" readonly="readonly">
													${get.contents }
													</textarea>
											</div>
										</div>
									</div>


										
											<c:forEach var="fname" items="${get.fnames }">
											<div class="input-group mb-3 fileCls">
												<div class="input-group-prepend">
													<span class="input-group-text" 
														onclick="downFile('${fname}')">첨부 파일(다운로드)</span>
												</div>
												
												<div class="custom-file">
													<input type="file" name="report" 
														class="custom-file-input" id="file01"/>
														
													<label class="custom-file-label" for="file01">${fname}</label>
												</div>		
											</div> 	 
											</c:forEach>









									<div class="form-group col-12">
										<div class="form-check">
											<div class="checkbox">
												<input type="checkbox" id="checkbox5"
													class="form-check-input" checked=""> <label
													for="checkbox5">Remember Me</label>
											</div>
										</div>
									</div>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
										<button type="reset" class="btn btn-light-secondary me-1 mb-1">삭제하기</button>
										<button type="button" class="btn btn-danger me-1 mb-1"
											onclick="location.href='${path}/output.do?projectkey=1'">뒤로가기</button>
									</div>
								</form>




							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>