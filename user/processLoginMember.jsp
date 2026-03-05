<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	System.out.println(email);
	System.out.println(password);
	
	if(email == null || password == null) {
%>
	<script>
		alert("이메일과 비밀번호를 확인해주세요.");
	</script>
	
<% 
		response.sendRedirect("../step09/index.jsp");
	} %>
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe"
driver="oracle.jdbc.driver.OracleDriver"
user="C##dbexam"
password="m1234"/>

<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT * FROM yemin_member WHERE email = ? and password = ?
	<sql:param value="<%= email %>"/>
	<sql:param value="<%= password %>"/>
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", email);
	%>
	<c:redirect url="../step09/index.jsp?msg=loginComplete"/>
</c:forEach>

<%-- <%
	Object result = pageContext.getAttribute("resultSet");
	session.setAttribute("user", result);
%> --%>

<%-- <c:if test="${resultSet.rowCount >= 1}">
	<c:redirect url="../step09/index.jsp?msg=loginComplete"/>
</c:if> --%>


</body>
</html>
