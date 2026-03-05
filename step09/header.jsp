<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String sessionId = (String)session.getAttribute("sessionId");
	System.out.println(sessionId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href='<c:url value="/step09/index.jsp" />'><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href='<c:url value="/step09/index.jsp"/>'>Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="<c:url value="/step09/products.jsp"/>">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value="/step09/cart.jsp"/>">Shopping Cart</a></li>
                </ul>
							</li>
               <li class="nav-item"><a class="nav-link" href='<c:url value="/BoardListAction.do?pageNum=1"/>'>Blog</a></li>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
              <c:choose>
              	<c:when test="${sessionId != null}">
              		<li class="nav-item"><a class="nav-link" href='<c:url value="/user/logoutMember.jsp"/>'>Logout</a></li>		
              	</c:when>
              	<c:otherwise>
              		<li class="nav-item"><a class="nav-link" href='<c:url value="/user/loginMember.jsp"/>'>Login</a></li>
              		<li class="nav-item"><a class="nav-link" href='<c:url value="/user/addMember.jsp"/>'>Regist</a></li>
              	</c:otherwise>
              </c:choose>
              
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><a href='<c:url value="/step09/cart.jsp"/>'><i class="ti-shopping-cart"></i></a> </li>
              <li class="nav-item"><a class="button button-header" href='<c:url value="/step09/products.jsp"/>'>Buy Now</a></li>
              <%-- <c:choose>
              	<c:when test="${sessionId == null}">
              		
              	</c:when>
              	<c:otherwise>
              		<li class="nav-item"><a class="button button-header" href="#"></a></li>
              	</c:otherwise>
              </c:choose> --%>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->