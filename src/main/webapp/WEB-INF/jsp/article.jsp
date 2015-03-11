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
					<li class="active"><a href="<c:url value="/taiji/view/article"/>">자유 게시판</a></li>
					<li><a href="<c:url value="/taiji/view/test"/>">서빠력 테스트</a></li>
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
	  <div class="panel panel-primary" id="viewPanel" style="display: none;">
		  <div class="panel-heading" id="viewTitle"></div>	
		  <div class="panel-body" id="viewContent"></div>
	</div>
	  <div class="panel panel-primary">
		  <div class="panel-heading">S.T.J 자유 게시판</div>	
		  <div class="panel-body">
		  	<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성 시간</th>
						<th>추천수</th>
					</tr>
				</thead>
				<tbody id="articleBody" style="cursor: pointer;">
				</tbody>
			</table>
			<nav>
			  <ul class="pager">
			    <li class="previous disabled"><a href="#" id="prev"><span aria-hidden="true">&larr;</span> 이전</a></li>
			    <li class="next"><a href="#" id="next">다음 <span aria-hidden="true">&rarr;</span></a></li>
			  </ul>
			</nav>
		 </div>
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
		var page=0;
		$('#prev,#next').on('click',function(e){
			if(!$(this).parent().hasClass('disabled')){
				$('#viewPanel').hide();
				getArticle(this.id);
			}else{
				e.preventDefault();
			}
		});
		
		function getView(seq){
			$.ajax({
				url : "<c:url value="/taiji/article/view/"/>"+seq,
				success : function(result){
					var resultData = JSON.parse(result);
					console.log(resultData);
					$('#viewTitle').text(resultData.title);
					$('#viewContent').html(resultData.content);
					$('#viewPanel').show();
					$(window).scrollTop(0);
				},
				error : function(result){
					console.log(result);
				}
			});
		}
		
		function getArticle(type){
			if(type=='prev')page>1?page--:page;
			else if(type=='next')page++;
			console.log(page);
			$.ajax({
				url : "<c:url value="/taiji/article/list/"/>"+page,
				success : function(result){
					var resultData = JSON.parse(result);
					console.log(resultData);
					if(resultData.first){
						$('.next').removeClass('disabled');
						$('.previous').addClass('disabled');
					}
					else if(resultData.last){
						$('.previous').removeClass('disabled');
						$('.next').addClass('disabled');
					}else{
						$('.previous').removeClass('disabled');
						$('.next').removeClass('disabled');
					}
					$('#articleBody').html('');
					for(var i = 0 ; i < resultData.content.length ; i ++){
						var data = resultData.content[i];
						var $seqTd = $("<td>",{text:data.seq});
						var $titleTd = $("<td>",{text:data.title});
						var $userTd = $("<td>",{text:data.userName});
						var $userLikeTd = $("<td>",{text:data.userLike});
						var $regDateTd = $("<td>",{text:data.regDate});
						var $tr = $("<tr>",{
											id:data.seq,
											click:function(){
												$(this).addClass('active');
												getView($(this).attr('id'));
											}
								}).append($seqTd).append($titleTd).append($userTd).append($regDateTd).append($userLikeTd);
						$('#articleBody').append($tr);
					}
				},
				error : function(result){
					console.log(result);
				}
			});
		}
		getArticle('next');
	});
	</script>
</body>
</html>