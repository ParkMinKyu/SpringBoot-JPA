<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="google-site-verification" content="9JfQoMouf7bhbt7dNj-Hyh7UoqCa5yu41Cbpclivfg4" />
<meta name="description" content="서태지 팬 사이트 입니다. 서태지와 관련된 글 및 이미지, 짤방 을 등록 해 주세요 ">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서태지 팬 사이트 - 메인 페이지</title>
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
				<a class="navbar-brand" href="<c:url value="/taiji/view/main"/>">S.T.J</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value="/taiji/view/article/list"/>">자유 게시판</a></li>
					<li><a href="<c:url value="/taiji/view/question"/>">서빠력 테스트</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">짤방모음 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value="/taiji/view/img/list/1"/>">태지보이스</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/5"/>">방황기</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/6"/>">6집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/7"/>">7집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/8"/>">8집</a></li>
							<li><a href="<c:url value="/taiji/view/img/list/9"/>">9집</a></li>
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
		  <div class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>Warning!</strong> 아래 분들은 글이 삭제 되거나 접근이 차단 될 수 있습니다.
			</div>
		  <ul class="list-group">
			  <li class="list-group-item">1. 몽충이들 접근 불가.</li>
			  <li class="list-group-item">2. 일베충 사절.</li>
			  <li class="list-group-item">3. 서태지의 음악을 10곡 이상 모르시는분.</li>
			  <li class="list-group-item">4. 의미없이 악플만 다는 분.</li>
			  <li class="list-group-item">5. 서태지와 관련없는 게시물을 작성하는분 등등.....</li>
			  <li class="list-group-item"><button type="button" class="btn btn-default" onclick="location.href='/taiji/view/article/list'">확인 완료</button></li>
		  </ul>	
	</div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/common.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- custom jquery -->
</body>
</html>