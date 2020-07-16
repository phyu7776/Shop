쇼핑몰 만들기 (Maria DB)
이미지 첨부 기능
%주의사항%
servlet-context.xml
``` java
	<!-- 업로드 패스 설정 --> 
<beans:bean class="java.lang.String" id="uploadPath">
	<beans:constructor-arg value="C:\Users\PHY\Documents\workspace-sts-3.9.13.RELEASE\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\shop\resources" />
  // 로컬 주소가아닌 서버가 돌아갈떄 경로로 설정할것 로컬 주소로 설정하면 경로가 맞는다 하여도 보안사항떄문에 이미지가 띄어지질 않습니다.
</beans:bean>

<!-- 일반 파일 업로드 경로 -->
	<resources mapping="/imgUpload/**" location="/resources/imgUpload/"/>
	
	<beans:bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver" id="multipartResolver">
		<beans:property name="maxUploadSize" value="10485760" />
	</beans:bean>


```
