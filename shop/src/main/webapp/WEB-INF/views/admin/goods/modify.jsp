<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
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
				<h2>상품 등록</h2>

					<form role="form" method="post" autocomplete="off">

						<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />

						<div class="inputArea">
							<label>1차 분류</label> <select class="category1">
								<option value="">전체</option>
							</select> <label>2차 분류</label> <select class="category2" name="cateCode">
								<option value="">전체</option>
							</select>
						</div>
						<div class="inputArea">
							<label for="gdsName">상품명</label> <input type="text" id="gdsName"
								name="gdsName" value="${goods.gdsName}" />
						</div>
						<div class="inputArea">
							<label for="gdsPrice">상품가격</label> <input type="text"
								id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" />
						</div>
						<div class="inputArea">
							<label for="gdsStock">상품수량</label> <input type="text"
								id="gdsStock" name="gdsStock" value="${goods.gdsStock}" />
						</div>
						<div class="inputArea">
							<label for="gdsDes">상품소개</label>
							<textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
						</div>
						<div class="inputArea">
							<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
							<button type="button" id="back_Btn" class="btn btn-warning">취소</button>

							<script>
								$("#back_Btn").click(function() {
									//history.back(); 
									location.href = "/controller/admin/goods/view?n=" + ${goods.gdsNum};
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
<script>
//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');

// 필요한 배열과 오브젝트 변수 생성
var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	if(jsonData[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
		cate1Obj = new Object();  // 초기화
		// cate1Obj에 cateCode와 cateName를 저장
		cate1Obj.cateCode = jsonData[i].cateCode; 
		cate1Obj.cateName = jsonData[i].cateName;
		// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
		cate1Arr.push(cate1Obj);
	}
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
	// cate1Arr에 저장된 값을 cate1Select에 추가
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"+ cate1Arr[i].cateName + "</option>");	
}


// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
$(document).on("change", "select.category1", function(){
	// 필요한 배열과 오브젝트 변수를 생성
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {  // 레빌이 2인 데이터가 있다면
			cate2Obj = new Object();  // 초기화
			
			// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.category2");
	cate2Select.children().remove();
 
	// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
	
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		
		// cate2Arr의 데이터를 cate2Select에 추가
		for(var i = 0; i < cate2Arr.length; i++) {
			
			// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
			if(selectVal == cate2Arr[i].cateCodeRef) {cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});
</script>
</body>
</html>