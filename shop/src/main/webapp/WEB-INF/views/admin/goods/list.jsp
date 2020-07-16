<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Home</title>
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
						<tr>
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
								<td>${list.gdsNum}</td>
								<td><a href="/controller/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a></td>
								<td>${list.cateCode}</td>
								<td><fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,### 원"/></td>
								<td><fmt:formatNumber value="${list.gdsStock}" pattern="### 개"/></td>
								<td><fmt:formatDate value="${list.gdsDate}" pattern="yyyy년 MM월 dd일 "/></td>
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