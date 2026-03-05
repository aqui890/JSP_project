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
	request.setCharacterEncoding("utf-8");

	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String mail = request.getParameter("email");
%>
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe"
driver="oracle.jdbc.driver.OracleDriver"
user="C##dbexam"
password="m1234"/>


<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO yemin_member VALUES (?, ?, ?, yemin_seq_num.nextval, sysdate, sysdate)
	<sql:param value="<%= name %>"/>
	<sql:param value="<%= pw %>"/>
	<sql:param value="<%= mail %>"/>
</sql:update>

<c:if test="${resultSet >= 1}">
	<c:redirect url="resultMember.jsp"/>
</c:if>


</body>
</html>