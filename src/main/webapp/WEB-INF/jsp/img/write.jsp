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
<title>서태지 팬 사이트 - 서태지 짤방 등록</title>
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
					<li  class="active" class="dropdown">
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
	<div class="page-header">
		<h2>서태지 ${imgGroup }'s 시절</h2>
	</div>
	  <div class="panel panel-primary" id="writePanel">
		  <div class="panel-heading">짤방 등록</div>	
		  <div class="panel-body">
			 <div id="writeAlert"></div>		  
			 <form name="writeForm" id="writeForm" enctype="multipart/form-data" onsubmit="return false;" method="post">
			  <div class="form-group">
			    <label for="title">Title</label>
			    <input type="text" class="form-control" name="title" maxlength="100" id="title" placeholder="title">
			  </div>
			  <div class="form-group">
			  	<label for="comment">Comment</label>
			    <input class="form-control" type="text" name="comment" maxlength="200" id="comment" placeholder="이미지 설명"></input>
			  </div>
			  <div class="form-group">
			  	<label for="image">Image <span style="color: red;">이미지 용량은 5M로 제한 합니다.</span></label>
			    <input class="form-control" type="file" name="image" id="image"></input>
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
	<!-- custom jquery -->
	<script type="text/javascript">
	  $(function(){
		  $('#saveWriteBtn').on("click",function(){
			  $('#writeAlert').html('');
			  		if($('#image')[0].files.length == 0 || $('#image')[0].files[0].type.indexOf('image')==-1){
		            	alert("이미지를 등록 하세요.");
		            }else if( $('#image')[0].files[0].size > 5120000000){
		            	alert('5M 이하의 파일만 등록 할 수 있습니다.');
		            }else{
		            	var data = new FormData();
			            $.each($('#image')[0].files, function(i, file) {          
			                data.append('image', file);
			            });
			            data.append('title', $('#title').val());
			            data.append('comment', $('#comment').val());
			            $.ajax({
			                url: '<c:url value="/taiji/imgarticle/upload/${imgGroup }"/>',
			                type: "post",
			                dataType: "text",
			                data: data,
			                // cache: false,
			                processData: false,
			                contentType: false,
			                success: function(result) {
			                    console.log(result);
			                    location.href = '<c:url value="/taiji/view/img/list/${imgGroup }"/>';
			                }, 
			                error: function(result) {
			                	console.log(result);
			                	alert('이미지 등록 실패.');
			                	var resultData = JSON.parse(result.responseText);
			                	
			                	if(resultData.success == false){
			                		var html = '<div class="alert alert-warning alert-dismissible" role="alert" id="writeAlert">';
									html += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="false">&times;</span></button>';
									html += '<strong>Warning!</strong> '+ resultData.msg + '</div>';
									$('#writeAlert').append(html);
									location.href="#writeAlert";
			                	}else{
			                		for(var i = 0 ; i < resultData.length ; i ++){
				                		var data = resultData[i];
										var html = '<div class="alert alert-warning alert-dismissible" role="alert" id="writeAlert">';
										html += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="false">&times;</span></button>';
										html += '<strong>Warning!</strong> <a href="#'+data.field+'" class="alert-link">' + data.field + '</a>의 '+ data.defaultMessage + '</div>';
										$('#writeAlert').append(html);
										location.href="#writeAlert";
									}
			                	}
			                }
		            	});
		            }
		  });
		  
	    $('#backBtn').on("click",function(){
	    	history.back();	
	    });
	  });
	</script>
</body>
</html>