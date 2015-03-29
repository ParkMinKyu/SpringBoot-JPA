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
					<li class="active"><a href="<c:url value="/taiji/view/article/list"/>">자유 게시판</a></li>
					<li><a href="<c:url value="/taiji/view/question"/>">서빠력 테스트</a></li>
					<li class="dropdown">
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
	  <div class="panel panel-primary" id="writePanel">
		  <div class="panel-heading">글 쓰기</div>	
		  <div class="panel-body">
			 <div id="writeAlert"></div>		  
			 <form name="writeForm" id="writeForm" onsubmit="return false;">
			 <input type="hidden" name="articleSeq" id="articleSeq">
			  <div class="form-group">
			    <label for="title">Title</label>
			    <input type="text" class="form-control" name="title" id="title" placeholder="title">
			  </div>
			  <div class="form-group">
			  	<label for="content">Content</label>
			    <textarea class="form-control" rows="6" name="content" id="content"></textarea>
			  </div>
			  <div class="form-group">
			    <label for="userName">User Name</label>
			    <input type="text" class="form-control" name="userName" id="userName" maxlength="20" placeholder="userName">
			  </div>
			  <div class="form-group">
			    <label for="password">Password</label>
			    <input type="password" class="form-control" name="password" id="password" maxlength="20" placeholder="password">
			  </div>
			  <button type="submit" id="backBtn" class="btn btn-default btn-lg pull-left"><span class="glyphicon glyphicon-arrow-left"></span> 뒤로</button>
			  <button type="submit" id="saveWriteBtn" class="btn btn-default btn-lg pull-right">등록 <span class="glyphicon glyphicon-save"></span></button>
			</form>
			 
		  </div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="/resources/external/jquery.hotkeys.js"></script>
	<script src="/resources/bootstrap-wysiwyg.js"></script>
	<!-- custom jquery -->
	<script type="text/javascript">
	  $(function(){
		  $('#saveWriteBtn').on("click",function(){
			  $('#writeAlert').html('');
			  $.ajax({
				  url:'${pageContext.request.contextPath}/taiji/article/save',
				  type:"POST",
				  data:JSON.stringify({seq:$('#articleSeq').val(),title:$('#title').val(),content:$('#content').val(),userName:$('#userName').val(),password:$('#password').val()}),
				  dataType:"json",
				  contentType: "application/json; charset=utf-8",
				  success:function(result){
					  console.log(result);
					  location.href="<c:url value="/taiji/view/article/list"/>";
				  },
				  error:function(result){
					  console.log(result);
					  for(var data in result.responseJSON){
						var html = '<div class="alert alert-warning alert-dismissible" role="alert" id="writeAlert">';
						html += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="false">&times;</span></button>';
						html += '<strong>Warning!</strong> <a href="#'+result.responseJSON[data].field+'" class="alert-link">' + result.responseJSON[data].field + '</a>의 '+ result.responseJSON[data].defaultMessage + '</div>';
						$('#writeAlert').append(html);
						location.href="#writeAlert";
					}
				  }
			  });
		  });
		  
		  
	    $('#backBtn').on("click",function(){
	    	history.back();	
	    });
	  });
	</script>
</body>
</html>