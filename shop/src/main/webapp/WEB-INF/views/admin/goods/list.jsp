<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>

<style>
	#container_box table{width:900px;}
	#container_box table th{ font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666;}
	#container_box table tr:hover{ background:#eee;}
	#container_box table td{padding 10px; text-align:center;}
	#container_box table img{width:150px; height:auto;}
</style>

</head>
<body>

	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside><%@ include file="../include/aside.jsp"%></aside>
			<div id="container_box">
					<h2>상품 목록</h2>

				<table>
					<thead>
						<tr><th>이미지</th>
							<th>번호</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>가격</th>
							<th>수량</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
							<td>
							<img src="${pageContext.request.contextPath}${list.gdsThumbImg}" />
								<td>${list.gdsNum}</td>
								<td><a href="/controller/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a></td>
								<td>${list.cateName}</td>
								<td><fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,### 원"/></td>
								<td><fmt:formatNumber value="${list.gdsStock}" pattern="### 개"/></td>
								<td><fmt:formatDate value="${list.gdsDate}" pattern="yyyy년 MM월 dd일 "/> </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>

</body>
</html>