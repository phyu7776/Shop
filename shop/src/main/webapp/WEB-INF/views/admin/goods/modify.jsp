<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
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
 	footer#footer { background:#f9f9f9; padding:20px; }
 	footer#footer ul li { display:inline-block; margin-right:10px; }
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
				<h2>상품 등록</h2>

					<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

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
							<script>
								var ckeditor_config = {
									resize_enaleb : false,
									enterMode : CKEDITOR.ENTER_BR,
									shiftEnterMode : CKEDITOR.ENTER_P,
									filebrowserUploadUrl : "/admin/goods/ckUpload"
								};

								CKEDITOR.replace("gdsDes", ckeditor_config);
							</script>
						</div>

						<div class="inputArea">
							<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
								name="file" />
							<div class="select_img">
								<img src="${pageContext.request.contextPath}${goods.gdsImg}" /> 
								<input type="hidden" name="gdsImg" value="${goods.gdsImg}" /> 
								<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />
							</div>

							<script>
  								$("#gdsImg").change(function(){
   									if(this.files && this.files[0]) {
    									var reader = new FileReader;
    									reader.onload = function(data) {
     										$(".select_img img").attr("src", data.target.result).width(500);        
    										}
    									reader.readAsDataURL(this.files[0]);
   										}
  									});
							 </script>
							 
							<%=request.getRealPath("/") %>
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
<script>
var regExp = /[^0-9]/gi;

$("#gdsPrice").keyup(function(){ numCheck($(this)); });
$("#gdsStock").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 var tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}
</script>
</body>
</html>