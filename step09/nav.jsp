<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">
    
    

      <a href="index.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">Tempo</h1>
      </a>
      
      <%
      	String sessionId = (String)session.getAttribute("sessionId");
      	System.out.println(sessionId);
      	
      %>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.jsp#hero">Home</a></li>
          <li><a href="index.jsp#about">About</a></li>
          <li><a href="index.jsp#services">Services</a></li>
          <li><a href="index.jsp#portfolio">Portfolio</a></li>
          <li><a href="<c:url value='/BoardListAction.do?pageNum=1'/>">게시판</a></li>
          <li><a href="index.jsp#team">Team</a></li>
          <li><a href="./products.jsp">Products</a></li>
          <li><a href="blog.jsp">Blog</a></li>
 		  <c:choose>
 		  	<c:when test="${sessionId != null}">
 		  		<li><a href='<c:url value="/user/logoutMember.jsp" />'>로그아웃</a></li>
	 			<li><a href='#'>회원정보수정</a></li>
	 			<p style="font-weight: bold; font-size: 18px;">로그인중</p>
 		  	</c:when>
 		  	<c:otherwise>
 		  		<li><a href='<c:url value="/user/addMember.jsp"/>'>회원가입</a></li>
		  		<li><a href='<c:url value="/user/loginMember.jsp"/>'>로그인</a></li>		
 		  	</c:otherwise>
 		  </c:choose>
          <c:choose>
          	<c:when test="${sessionId eq 'admin@gmail.com'}">
				<li class="dropdown"><a href="#"><span>Admin</span> 
					<i class="bi bi-chevron-down toggle-dropdown"></i></a>
					<ul>
						<li><a href="./addProduct.jsp">상품 등록</a></li>
						<li><a href="#">상품 수정</a></li>
						<li><a href="#">상품 삭제</a></li>
						<li><a href="#">회원 목록</a></li>
					</ul>
				</li>
			</c:when>
          	<c:otherwise>
          		
          	</c:otherwise>
          </c:choose>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>