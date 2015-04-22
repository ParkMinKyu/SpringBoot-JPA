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
<title>서태지 팬 사이트 - 서태지 자유 게시판</title>
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
	  <div class="panel panel-primary" id="viewPanel" style="display: none;">
		  <div class="panel-heading">글 보기</div>	
		  <div class="panel-body">
		  	<div class="page-header">
			  <h2 id="viewTitle"></h2>
			</div>
		  	<div id="viewContent"></div>
		  	
		  	<div class="btn-group pull-right">
		  		<button type="button" id="userLike" class="btn btn-default">추천 <span class="badge" id="userLikeCnt">0</span> <span class="glyphicon glyphicon-thumbs-up"></span></button>
			  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#exampleModal" data-whatever="@비밀번호 입력">글 삭제 <span class="glyphicon glyphicon-trash"></span></button>
			</div>
		</div>
	</div>
	
	<!-- 게시글 삭제 비밀번호  -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">글 삭제</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">비밀번호:</label>
            <input class="form-control" type="password" maxlength="20" id="articlePassword"/>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="articleDeleteBtn">Send password</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- 댓글 삭제 비밀번호  -->
	<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="commentModalLabel">댓글 삭제</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">비밀번호:</label>
            <input class="form-control" type="password" maxlength="20" id="commentPassword"/>
            <input class="form-control" type="hidden" id="commentSeq"/>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="commentDeleteBtn">Send password</button>
      </div>
    </div>
  </div>
</div>
	
	
	  <div class="panel panel-primary" id="commentPanel" style="display: none;">
		  <div class="panel-heading">댓글(<span id="commentCount"></span>)</div>	
		  <div class="panel-body">
		  		<!-- comment 영역 -->
		  		<ul class="list-group" id="commentList">
				</ul>
		  		<!-- comment 영역 -->
			 <div id="commentAlert"></div>		  
			 
			 <form onsubmit="return false;">
			 <input type="hidden" id="articleSeq">
			 <div class="form-group">
			    <label for="content">content</label>
			    <textarea class="form-control" id="content" rows="3"></textarea>
			  </div>
			  <div class="form-group">
			    <label for="userName">User Name</label>
			    <input type="text" class="form-control" maxlength="20" id="userName" placeholder="userName">
			  </div>
			  <div class="form-group">
			    <label for="password">Password</label>
			    <input type="password" class="form-control" maxlength="20" id="password" placeholder="password">
			  </div>
			  <button type="submit" id="saveCommentBtn" class="btn btn-default btn-lg pull-right">등록 <span class="glyphicon glyphicon-save"></span></button>
			</form>
			 
		  </div>
	</div>
		  	<!-- Split button -->
			<div class="btn-group pull-right">
			  <button type="button" class="btn btn-default" id="articleWriteBtn">글 쓰기 <span class="glyphicon glyphicon-pencil"></span></button>
			  <button type="button" class="btn btn-default">정렬기준 <span class="glyphicon glyphicon-sort-by-attributes-alt"></span></button>
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#" id="orderUserLike">추천 순 <span class="glyphicon glyphicon-thumbs-up"></span></a></li>
			    <li><a href="#" id="orderRegDate">날짜 순 <span class="glyphicon glyphicon-calendar"></span></a></li>
			  </ul>
			</div>
		  	<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>추천</th>
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
	<input type="hidden" id="orderName" value="seq">
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/common.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- custom jquery -->
	<script type="text/javascript">
	$(function(){
		var page=0;
		
		$('#orderUserLike, #orderRegDate, #orderReset').on('click',function(){
			var orderType = $('#orderType').val();
			if(this.id == 'orderUserLike'){
				 $('#orderName').val('userLike');
			}else if(this.id == 'orderRegDate'){
				$('#orderName').val('seq');
			}
			getArticle();
			$('#commentPanel').hide();
			$('#viewPanel').hide();
		});
		
		$('#prev,#next').on('click',function(e){
			if(!$(this).parent().hasClass('disabled')){
				$('#viewPanel').hide();
				$('#commentPanel').hide();
				getArticle(this.id);
			}else{
				e.preventDefault();
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
		
		$('#articleDeleteBtn').on("click",function(){
			var password = $('#articlePassword').val();
			$.ajax({
				url:'${pageContext.request.contextPath}/taiji/article/delete/',
				type:"DELETE",
				data : JSON.stringify({seq : $('#articleSeq').val(),password : password}),
				dataType : "json",
				contentType: "application/json; charset=utf-8",
				success:function(result){
					console.log(result);
					alert("삭제 완료.");
					location.reload();
				},
				error:function(result){
					alert("삭제 실패. 비밀번호가 다르거나 일시적인 서버 오류 입니다.");
					console.log(result);
				}
			});
		});
		
		$('#commentDeleteBtn').on("click",function(){
			$.ajax({
				url:'${pageContext.request.contextPath}/taiji/article/comment/delete/',
				type:"DELETE",
				data : JSON.stringify({seq : $('#commentSeq').val(),password : $('#commentPassword').val()}),
				dataType : "json",
				contentType: "application/json; charset=utf-8",
				success:function(result){
					console.log(result);
					alert("삭제 완료.");
					$('#commentSeq').val('');
					$('#commentPassword').val('');
					$('#commentModal').modal('hide');
					getView($('#articleSeq').val());
					getArticle();
				},
				error:function(result){
					alert("삭제 실패. 비밀번호가 다르거나 일시적인 서버 오류 입니다.");
					console.log(result);
				}
			});
		});

		$('#commentPanel').on("click","#commentDeleteBtn",function(){
			$('#commentSeq').val($(this).attr("data-value"));
		});
		
		$('#articleWriteBtn').on("click",function(){
			location.href = '${pageContext.request.contextPath}/taiji/view/article/write';
		});
		
		$('#userLike').on("click",function(){
			var cookies = getCookie('userLikes').split("#");
			var isCookies = false;
			for(var i = 0 ; i < cookies.length ; i ++){
				if(cookies[i] == $('#articleSeq').val()){
					alert("이미 추천 하였습니다.");
					isCookies = true;
					break;
				}
			}
			if(!isCookies){
				var cookieValue = getCookie('userLikes') + '#'+$('#articleSeq').val();  
				setCookie('userLikes', cookieValue);			
				$.ajax({
					url : '${pageContext.request.contextPath}/taiji/article/view/userLike/'+$('#articleSeq').val(),
					type:'PUT',
					asnyc:false,
					success : function(result){
						var resultData = JSON.parse(result);
						$('#userLikeCnt').text(resultData.userLike);
						getArticle();
					},
					error : function(result){
						console.log(result);
					}
				});
			}
		});
		
		$('#saveCommentBtn').on("click",function(){
			$('#commentAlert').html('');
			var comment = {articleSeq : $('#articleSeq').val(), userName: $('#userName').val(), password: $('#password').val(), content: $('#content').val()}; 
			$.ajax({
				url : "${pageContext.request.contextPath}/taiji/article/comment/save",
				data: JSON.stringify(comment),
				dataType : "json",
				contentType: "application/json; charset=utf-8",
				type:'post',
				success : function(result){
					getView(result.articleSeq);
					getArticle();
				},
				error : function(result){
					for(var data in result.responseJSON){
						var html = '<div class="alert alert-warning alert-dismissible" role="alert" id="commentAlert">';
						html += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="false">&times;</span></button>';
						html += '<strong>Warning!</strong> <a href="#'+result.responseJSON[data].field+'" class="alert-link">' + result.responseJSON[data].field + '</a>의 '+ result.responseJSON[data].defaultMessage + '</div>';
						$('#commentAlert').append(html);
						location.href="#commentAlert";
					}
				}
			});
		});
		
		function setFocus(id){
			$('#'+id).fucus();
		}
		
		function getView(seq){
			$.ajax({
				url : "${pageContext.request.contextPath}/taiji/article/view/"+seq,
				success : function(result){
					createViewAndComment(result);		
				},
				error : function(result){
					console.log(result);
				}
			});
		}

		//뷰 생성
		function createViewAndComment(result){
			var resultData = JSON.parse(result);
			var article = resultData.articleResponse; 
			var comments = resultData.commentsResponse;
			console.log(resultData);
			
			$('#viewTitle').text(article.title).append('<small class="pull-right">' + article.userName +' : ' + article.regDate + ' </small>');
			$('#viewContent').html(article.content.replace(new RegExp('\n','g'),'<br>'));
			$('#userLikeCnt').html(article.userLike);
			$('#commentCount').text(comments.length);
			
			
			$('#commentList').html('');
			for(var i = 0 ; i < comments.length ; i ++){
				var c = comments[i];
				var $li = $('<li class="list-group-item">').html('<strong>'+c.userName + '</strong> : ' + c.content );
				var $span = $('<span class="pull-right">').html(c.regDate);
				var $button = $('<button type="button" id="commentDeleteBtn" data-toggle="modal" data-target="#commentModal" data-whatever="@비밀번호 입력" data-value="'+c.seq+'" class="btn btn-default btn-xs pull-right">삭제</button>');
				$('#commentList').append($li.append($button).append($span));
			}
			$('#userName').val('');
			$('#password').val('');
			$('#content').val('');
			$('#commentPanel').show();
			$('#viewPanel').show();
			$(window).scrollTop(0);

		}
		
		//리스트 생성
		function getArticle(type){
			var orderName = $('#orderName').val();
			var orderType = $('#orderType').val();
			if(type=='prev')page>1?page--:page;
			else if(type=='next')page++;
			console.log(page);
			$.ajax({
				url : "${pageContext.request.contextPath}/taiji/article/list/"+page+"/"+orderName,
				success : function(result){
					var resultData = JSON.parse(result);
					var articles = resultData.articlesResponse;
					console.log(resultData);
					if(resultData.first && resultData.last){
						$('.next').addClass('disabled');
						$('.previous').addClass('disabled');
					}else if(resultData.first && !resultData.last){
						$('.next').removeClass('disabled');
						$('.previous').addClass('disabled');
					}else if(resultData.last){
						$('.previous').removeClass('disabled');
						$('.next').addClass('disabled');
					}else{
						$('.previous').removeClass('disabled');
						$('.next').removeClass('disabled');
					}
					$('#articleBody').html('');
					for(var i = 0 ; i < articles.length ; i ++){
						var data = articles[i];
						var $seqTd = $("<td>",{text:data.seq});
						var $titleTd = $("<td>",{html:data.title + " <span style='color:red'>("+data.comments.length+")</span>"});
						var $userTd = $("<td>",{text:data.userName});
						var $userLikeTd = $("<td>",{html:"<span class='badge' id='userLikeCnt'>"+data.userLike+"</span>"});
						var date = new Date(data.regDate);
						var $regDateTd = $("<td>",{text:(date.getYear()-100)+'/'+(date.getMonth()+1)+'/'+date.getDate()});
						var $tr = $("<tr>",{
											id:data.seq,
											click:function(){
												$('#articleSeq').val($(this).attr('id'));
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