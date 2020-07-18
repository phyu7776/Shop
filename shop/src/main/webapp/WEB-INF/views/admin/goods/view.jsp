<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
		<title>Home</title>
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
 	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 	ul { padding:0; margin:0; list-style:none;  }

	div#root { width:90%; margin:0 auto; }
 
 	header#header { font-size:60px; padding:20px 0; }
 	header#header h1 a { color:#000; font-weight:bold; }
 
 	nav#nav { padding:10px; text-align:right; }
 	nav#nav ul li { display:inline-block; margin-left:10px; }

    section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 	section#container::after { content:""; display:block; clear:both; }
 	aside { float:left; width:200px; }
 	div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 	aside ul li { text-align:center; margin-bottom:10px; }
 	
 	section#container { }
 
 aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside li { font-size:16px; text-align:center; }
 aside li a { color:#000; display:block; padding:10px 0; }
 aside li a:hover { text-decoration:none; background:#eee; }
 
 aside li { position:relative; }
 aside li:hover { background:#eee; }   
 aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
 aside li:hover > ul.low { display:block; }
 aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
 aside li:hover > ul.low li a:hover { background:#fff;}
 aside li > ul.low li { width:180px; }
 
 	footer#footer { background:#f9f9f9; padding:20px; }
 	footer#footer ul li { display:inline-block; margin-right:10px; }
 	
 	.gdsDes img { max-width:600px; height:auto; }
</style>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
	<aside><%@ include file="../include/aside.jsp" %></aside>
		<div id="container_box">
			<section id="content">
				<h2>상품 조회</h2>

					<form role="form" method="post" autocomplete="off">
					
					<input type="hidden" name="n" value="${goods.gdsNum}" />

						<div class="inputArea">
							<label>1차 분류</label> <span class="category1">${goods.cateCodeRef}</span> 
							<label>2차 분류</label> <span class="category2">${goods.cateCode}</span>
						</div>

						<div class="inputArea">
							<label for="gdsName">상품명</label> <span>${goods.gdsName}</span>
						</div>

						<div class="inputArea">
							<label for="gdsPrice">상품가격</label> 
							<span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,### 원" />
							</span>
						</div>

						<div class="inputArea">
							<label for="gdsStock">상품수량</label> <span>${goods.gdsStock}</span>
						</div>

						<div class="inputArea">
							<label for="gdsDes">상품소개</label><!--<span>${goods.gdsDes}</span>  --> 
							<div class="gdsDes">${goods.gdsDes}</div>
						</div>
						
						<div class="inputArea">
							<label for="gdsImg">이미지</label>
							<p>원본 이미지</p>
							<img src="${pageContext.request.contextPath}${goods.gdsImg}" class="oriImg" />
							<p>썸네일</p>
							<img src="${pageContext.request.contextPath}${goods.gdsThumbImg}" class="thumbImg" />
						</div>

						<div class="inputArea">
							<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
							<input type="hidden" name="gdsImg" value="${goods.gdsImg}" /> 
							<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
							<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />

							<script>
								var formObj = $("form[role='form']");

								$("#modify_Btn").click(function() {
											formObj.attr("action","/controller/admin/goods/modify");
											formObj.attr("method", "get")
											formObj.submit();
										});

								$("#delete_Btn").click(function(){
									 
									 var con = confirm("정말로 삭제하시겠습니까?");
									 
									 if(con) {      
									  formObj.attr("action", "/controller/admin/goods/delete");
									  formObj.submit();
									 }
									});
							</script>
						</div>

					</form>
				</section>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>
</div>

</body>
</html>