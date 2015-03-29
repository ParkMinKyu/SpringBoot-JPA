<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서빠력 테스트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/taiji/view/main"/>">S.T.J</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/taiji/view/article/list"/>">자유 게시판</a></li>
					<li><a href="<c:url value="/taiji/view/question"/>">서빠력 테스트</a></li>
					<li class="active" class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">짤방모음 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value="/taiji/view/img/list/boys"/>">태지보이스</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/solo5"/>">방황기</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/solo6"/>">6집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/solo7"/>">7집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/solo8"/>">8집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/solo9"/>">9집</a></li>
						</ul>
					</li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">
	<div class="row">
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test1.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test2.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test3.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="row">
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test4.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test5.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test6.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-6 col-sm-3">
	    <div class="thumbnail">
	      <img src="<c:url value="/resources/img/upload/solo8/test7.jpg"/>" alt="솔로 8집">
	      <div class="caption">
	        <h3>서태지 이미지</h3>
	        <p>뮤직 비디오의 한장면</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	</div>
	
	</div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/common.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- custom jquery -->
	<script type="text/javascript">
	$(function(){
	});
	</script>
</body>
</html>