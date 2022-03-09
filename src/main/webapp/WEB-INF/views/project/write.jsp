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
							<h4 class="card-title">프로젝트 공지사항</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form" action="/project5/projectWrite.do">
									<div class="row">
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="first-name-column">First Name</label> <input
													type="text" id="first-name-column" class="form-control"
													placeholder="First Name" name="fname-column">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="last-name-column">Last Name</label> <input
													type="text" id="last-name-column" class="form-control"
													placeholder="Last Name" name="lname-column">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="city-column">City</label> <input type="text"
													id="city-column" class="form-control" placeholder="City"
													name="city-column">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="country-floating">Country</label> <input
													type="text" id="country-floating" class="form-control"
													name="country-floating" placeholder="Country">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="company-column">Company</label> <input
													type="text" id="company-column" class="form-control"
													name="company-column" placeholder="Company">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="email-id-column">Email</label> <input
													type="email" id="email-id-column" class="form-control"
													name="email-id-column" placeholder="Email">
											</div>
										</div>
										<div class="col-md-6 col-12">
											<div class="form-group">
												<label for="email-id-column">Contents</label> <textarea
													 class="form-control"
													name="contents" placeholder="Contents" rows="4"></textarea>
											</div>
										</div>
											
										
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
											<button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
											<button type="reset"
												class="btn btn-light-secondary me-1 mb-1">Reset</button>
										</div>
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