<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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
					<li><a href="<c:url value="/taiji/view/article"/>">자유 게시판</a></li>
					<li class="active"><a href="<c:url value="/taiji/view/test"/>">서빠력 테스트</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">짤방모음 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">태지보이스</a></li>
							<li><a href="#">방황기</a></li>
							<li><a href="#">6집</a></li>
							<li><a href="#">7집</a></li>
							<li><a href="#">8집</a></li>
							<li><a href="#">9집</a></li>
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
	
	<div class="jumbotron">
	  <div class="container">
		<div class="panel panel-primary">
		  <div class="panel-heading">S.T.J 테스트</div>	
		  <div class="panel-body">	  
	    	<h2 id="question"></h2>
	    </div>
	    <div class="list-group">
		  <a href="#" id="answer1" class="list-group-item"></a>
		  <a href="#" id="answer2" class="list-group-item"></a>
		  <a href="#" id="answer3" class="list-group-item"></a>
		  <a href="#" id="answer4" class="list-group-item"></a>
		  <a href="#" id="answer5" class="list-group-item"></a>
		</div>
	    <nav>
			<ul class="pager">
				<li class="previous"><a href="#" id="prev"><span aria-hidden="true">&larr;</span> 이전</a></li>
				<li class="next"><a href="#" id="next">다음 <span aria-hidden="true">&rarr;</span></a></li>
			</ul>
		</nav>
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
		var num=0;
		$('#prev,#next').on('click',function(){
			getQuestion(this.id);
		});
		
		$('.list-group > a').on("click",function(){
			$('.list-group > a').removeClass("active");
			$(this).addClass("active");
		});
		
		function getQuestion(type){
			if(type=='prev')num>1?num--:num;
			else if(type=='next')num++;
			console.log(num);
			$.ajax({
				url : "<c:url value="/taiji/question/"/>"+num,
				success : function(result){
					var resultData = JSON.parse(result);
					var question = resultData.question;
					var answer = resultData.answers;
					console.log(question);
					console.log(answer);
					$('#question').text("Q" + num + ". " + question.title);
					for(var i = 0 ; i < answer.length ; i ++){
						var a = answer[i];
						$('#answer'+(i+1)).text((i+1) + '. ' +a.content);
					}
				},
				error : function(result){
					console.log(result);
				}
			});
		}
		getQuestion('next');
	});
	</script>
</body>
</html>