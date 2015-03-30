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
	<div class="row">
	  <div class="col-md-12">
			<div class="btn-group pull-right">
		  <button type="button" class="btn btn-default" id="writeBtn">짤방 등록 <span class="glyphicon glyphicon-pencil"></span></button>
		  <button type="button" class="btn btn-default">정렬기준 <span class="glyphicon glyphicon-sort-by-attributes-alt"></span></button>
		  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		   <span class="caret"></span>
		   <span class="sr-only">Toggle Dropdown</span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">추천 순 <span class="glyphicon glyphicon-thumbs-up"></span></a></li>
		    <li><a href="#">날짜 순 <span class="glyphicon glyphicon-calendar"></span></a></li>
		    <li class="divider"></li>
		    <li><a href="#">초기화 <span class="glyphicon glyphicon-retweet"></span></a></li>
		  </ul>
		</div>
		</div>
	</div>
	
	<br/>
	
	<div id="imgList"></div>
	
	</div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/common.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- custom jquery -->
	<script type="text/javascript">
	$(function(){
		$('#writeBtn').on('click',function(){
			location.href = '<c:url value="/taiji/view/img/write/${imgGroup}"/>';
		});
		
		$.ajax({
			url : '<c:url value="/taiji/imgarticle/${imgGroup }"/>',
			type : 'get',
			success : function(result){
				console.log(result);
				var resultData = JSON.parse(result);
				var rowCnt = (resultData.length%4 == 0 ? parseInt(resultData.length/4) : parseInt((resultData.length/4)+1));
				for(var k = 0 ; k < rowCnt ; k ++){
					var $row = $('<div class="row">'); 
					var colCnt = (((k+1)*4) > resultData.length ? parseInt(resultData.length) : parseInt(((k+1)*4)) );
					for(var i = (k*4) ; i < colCnt ; i ++){
						var data = resultData[i];
						var $col = $('<div class="col-xs-12 col-sm-3">');
						var $thumbnail = $("<div class='thumbnail'>");
						var $img = $('<img src="${pageContext.request.contextPath}'+data.path+'/'+data.name+'" alt="'+data.title+'">');
						var $caption = $('<div class="caption">');
						var $title = $("<h3>",{text:data.title});
						var $comment = $("<p>",{text:data.comment});
						var $button = $('<p><a target="_blank" href="${pageContext.request.contextPath}'+data.path+'/'+data.name+'" class="btn btn-primary" role="button">크게 보기</a> <a href="#" id="imgLike" class="btn btn-default" data-value="'+data.seq+'" role="button">추천 <span class="badge">'+data.userLike+'</span></a></p>');
						$row.append($col.append($thumbnail.append($img).append($caption).append($title).append($comment).append($button)));
					}
				$('#imgList').append($row);
				}
			},
			error : function(result){
				
			}
		});
		
		function setCookie(cname, cvalue, exdays) {
		    var d = new Date();
		    d.setTime(d.getTime() + (exdays*24*60*60*1000));
		    var expires = "expires="+d.toUTCString();
		    document.cookie = cname + "=" + cvalue + "; " + expires;
		}
			
		function getCookie(cname) {
		    var name = cname + "=";
		    var ca = document.cookie.split(';');
		    for(var i=0; i<ca.length; i++) {
		        var c = ca[i];
		        while (c.charAt(0)==' ') c = c.substring(1);
		        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
		    }
		    return "";
		}
		
		$('#imgList').on("click",'#imgLike',function(){
			var cookies = getCookie('imgLikes').split("#");
			var $target = $(this).find('span');
			var isCookies = false;
			for(var i = 0 ; i < cookies.length ; i ++){
				if(cookies[i] == $(this).attr('data-value')){
					alert("이미 추천 하였습니다.");
					isCookies = true;
					break;
				}
			}
			if(!isCookies){
				var cookieValue = getCookie('imgLikes') + '#'+$(this).attr('data-value');  
				setCookie('imgLikes', cookieValue);			
				$.ajax({
					url : '${pageContext.request.contextPath}/taiji/imgarticle/imgLike/'+$(this).attr('data-value'),
					type:'PUT',
					asnyc:false,
					success : function(result){
						var resultData = JSON.parse(result);
						$target.text(resultData.userLike);
					},
					error : function(result){
						console.log(result);
					}
				});
			}
		});
	});
	</script>
</body>
</html>