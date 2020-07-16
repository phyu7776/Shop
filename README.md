
![img](캡쳐.)
쇼핑몰 만들기 (Maria DB)  
이미지 첨부 기능  
%주의사항%  
servlet-context.xml  
``` java
	<!-- 업로드 패스 설정 --> 
<beans:bean class="java.lang.String" id="uploadPath">
	<beans:constructor-arg value="C:\Users\PHY\Documents\workspace-sts-3.9.13.RELEASE\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\shop\resources" />
  // 로컬 주소가아닌 서버가 돌아갈떄 경로로 설정할것 로컬 주소로 설정하면 경로가 맞는다 하여도 보안사항떄문에 이미지가 띄어지질 않습니다.
  // register.jsp 파일에서 <%=request.getRealPath("/") %> 를 실행하면 실제 경로를 볼수있습니다.
</beans:bean>

<!-- 일반 파일 업로드 경로 -->
	<resources mapping="/imgUpload/**" location="/resources/imgUpload/"/>
	
	<beans:bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver" id="multipartResolver">
		<beans:property name="maxUploadSize" value="10485760" />
	</beans:bean>

```
view.jsp 에서 위처럼 하였음에도 불구하고 경로를 못찾는다면 경로 앞에 ${pageContext.request.contextPath} 를 붙일것  
tomcat 서버 설정을 건드리면 수정할수 있으나 필자는 수정해야 할게 너무 많기떄문에 그냥 두겠습니다.

이미지 조회 수정 기능
이유는 모르겠으나 jsp -> controller -> service -> persistence -> mapper 로 작동되는데 mapper 로 가는 순서가 수정이 되질않고 그냥 돌아가는 현상이 발생
다시 작성해보았음에도 이부분에서 계속 같은문제 발생 Spring을 재시작 하면 해결되긴하는데 잘모르겠습니다 ..  

삭제 기능에 이미지도 자동으로 삭제해주는 기능이 나와있지않아서 직접 수정하였습니다.
간단하게 view.jsp 파일 원본 이미지와 썸네일 이미지쪽에 hidden type으로 이미지와 썸네일 이미지의 값을 가져오는 코드를 적으시면 됩니다.
``` JavaScript
	<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
	<input type="hidden" name="gdsImg" value="${goods.gdsImg}" /> 
	<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
	<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />
```
admincontroller.java 에서 uploadPath 경로에 요청한 파라미터 값으로 delete 를 적습니다.
``` java
// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum,HttpServletRequest req) throws Exception {
	 logger.info("post goods delete");

	  new File(uploadPath + req.getParameter("gdsImg")).delete();
	  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
	 adminService.goodsDelete(gdsNum);
	 
	 return "redirect:/admin/goods/list";
	}
```

