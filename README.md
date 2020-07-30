
![](https://github.com/phyu7776/Shop/blob/master/%EC%BA%A1%EC%B2%98.JPG)  

유저로 부터 요청이 들어오면 Controller에 연결되어 HandlerMapping 을 참조명령어를 실행 합니다 
Controller 에서 넘어간 요청은 Service를 호출하고 필요한 데이터들을 DAO를 통해 Mapper 를 실행하여
필요한 DB를 조회하거나 요청한 작업을 수행합니다.
쇼핑몰 만들기 (Maria DB)  

데이터 베이스와 스프링 연동
데이터 베이스에 테이블을 생성후
Domain pakage 생성 -> VO(DTO)생성
vo는 Value object 의 약자로 계층간 데이터 교환을 위한 객체이다
vo클래스에 데이터베이스에서 만든 테이블의 형식에 맞춰 생성 하고
Getter와 Setter 를 생성해줍니다.

pom.xml 파일에서
```
<!-- maria db -->
<dependency>
    <groupId>org.mariadb.jdbc</groupId>
    <artifactId>mariadb-java-client</artifactId>
    <version>2.3.0</version>
</dependency>

<!-- org.mybatis/mybatis -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.4.1</version>
</dependency>

<!-- mybatis-spring -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>1.3.0</version>
</dependency>

<!-- spring-jdbc -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>${org.springframework-version}</version>
</dependency>
```
입력하는데 이코드가 mariadb와 연동을 할 수있게 해주는 코드입니다.

root-context.xml - namespace텝 에 필요한 configuration file 을 체크합니다. ( beans, context, jdbc, mybatis)

데이터 베이스에 접속할수 있도록 Source 텝에 빈(bean)코드를 추가합니다
```
<bean
 class="org.springframework.jdbc.datasource.DriverManagerDataSource"
 id="dataSource">
 <property name="driverClassName" value="org.mariadb.jdbc.Driver" />
 <property name="url" value="jdbc:mariadb://127.0.0.1:3306" />
 <property name="username" value="이름" />
 <property name="password" value="비밀번호" />
</bean>

<bean id="sqlSessionFactory"
 class="org.mybatis.spring.SqlSessionFactoryBean">
 <property name="dataSource" ref="dataSource" />
 <property name="configLocation" value="classpath:/mybatis-config.xml" />
 <property name="mapperLocations" value="classpath:mappers/**/*Mapper.xml" />
</bean>

<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
 <constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"/>
</bean>
```
src/main/resources 에 mybatis-config.xml 파일 생성 (https://blog.mybatis.org/) 를 참조
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

</configuration>
```
추가합니다
src/main/resources 에 mapper폴더 추가 Mapper.xml 파일도 추가
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.board.mappers.board"> // <- 메퍼 주소 맞춰주세요

</mapper>
```

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
댓글기능
관리자권한말고 일반 모드에서 댓글을 달거나 상품을 볼수있게 해놓았습니다
shop/view 에서 각 카테고리에 해당하는 상품들을 볼수있습니다.
구조가 WEB-INF/views/shop/list 인데 
다른 메뉴 aside, header 를 잇는 주소는 ../include/aside.jsp 이런식으로 파일 주소를 ../ 으로 시작하면 연결되는데
view페이지는 그게 안되고 /controller/를 정확하게 적어주어야 합니다. ../ 으로 하면 주소인식을 못합니다.
주소 구조를보면
/controller/shop/view?n=${list.gdsNum}
인데
? 뒤에는 여러 파라미터 들이 붙을수있습니다. 
지금은 gdsNum 을 불러옵니다
Controller로 view 의 get 코드를 보시면 @RequestParam("n"),int gdsNum 으로 해당하는 상품번호를 불러오는것입니다.
Model 은 파라미터를 뷰로 넘길수있습니다.
```java
//상품 조회
	@RequestMapping(value = "/view",method = RequestMethod.GET)
	public void getView(@RequestParam("n")int gdsNum,Model model) throws Exception{
		logger.info("get view");
		
		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view",view);
		}
```

ShopService에 goodsView라는 명령어를통해 전달 전달 ... 해서  GoodsViewVO 타입의 view 변수에 집어넣습니다
ex) model.addAttribute("변수이름",변수에 넣을 데이터 값);
model.addAttribute("view",view);명령어를 통하여 모델을 통해 view로 넘기면
jsp 파일에 보시면 불러오는 명령어 view.gdsName
			        view.cateName 등등...
Controller를 통해 담아온 정보를 볼수있습니다.
