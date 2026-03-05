<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../step09/header.jsp" %>
<%
	List boardList = (List)request.getAttribute("boardlist");
	int pageNum = (Integer)request.getAttribute("pageNum");
	int total_record = (Integer)request.getAttribute("total_record");
	int total_page = (Integer)request.getAttribute("total_page");
	
	String sessionI = (String)session.getAttribute("sessionId");
	
	System.out.println(sessionId);
%>

<main class="main">

    <!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>Our Blog</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Blog</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->
	
	<!-- .container>.row-->
	<div class="container mt-5 pt-5">
		<div class="row">
			<div class="search-control" style="margin-bottom: 30px;">
                <form action="" id="search-form">
                    <div class="form-inner d-flex">
                        <select name="items" id="items" class="form-control" style="width: 100px; border-radius: 50px; margin-right: 10px;">
                            <option value="title">title</option>
                            <option value="content">content</option>
                            <option value="user_name">author</option>
                        </select>
                        <div class="form-group">
                            <div class="inner d-flex" style="position: relative;">
                                <input type="text" name="text" id="search-input" class="form-control" style="border-radius: 50px; width: 200px;" placeholder="검색어를 입력하세요">
                                <i onclick="document.querySelector('#search-form').submit()" class="fas fa-search" style="position: absolute; bottom: 13%; right: 5%; transform: translate(-50%, -50%); cursor: pointer;"></i>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
			<div class="col-2 text-end">
				<span class="badge bg-success">전체 <%= total_record %>건</span>
			</div>
		</div>
		<div class="row">
			<table class="table" style="width: 100%;">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
					<th scope="col">업데이트 날짜</th>
				</tr>
				<%
				for (int i = 0; i < boardList.size(); i++) {
					BoardDTO boardDTO = (BoardDTO) boardList.get(i);
				%>
				<tr>
					<td><%=boardDTO.getYemin_num()%></td>
                    <td><a href="${pageContext.request.contextPath}/board/board.jsp?id=<%=boardDTO.getYemin_num()%>"><%=boardDTO.getTitle()%></a></td>
                    <td><%=boardDTO.getUserName()%></td>
                    <td><%=boardDTO.getRegist_day()%></td>
                    <td><%=boardDTO.getUpdate_day()%></td>
				</tr>
				<% } %>
			</table>
			<!-- <div class="btn-wrap" style="display: flex; justify-content: end; margin-top: 30px;">
				<a href="#" onclick="loginCheck()" class="btn btn-dark col-1 write-btn">글쓰기</a>
			</div> -->
		</div>
		<div class="row" style="display: flex; justify-content: center;">
			 <nav class="blog-pagination justify-content-center d-flex">
                <ul class="pagination">
                   	<c:set var="pageNum" value="<%= pageNum %>"/>
					<c:forEach var="i"  begin="1" end="<%= total_page %>">
						<%-- <a href="./BoardListAction.do?pageNum=${i}"> --%>
						<c:choose>
							<c:when test="${pageNum == i}">
								<li class="page-item">
                                  <a href="./BoardListAction.do?pageNum=${i}" class="page-link active">${i}</a>
                              	</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
                                  <a href="./BoardListAction.do?pageNum=${i}" class="page-link active">${i}</a>
                              	</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
                 </ul>
			</nav>
			<%-- <div class="col d-flex text-center justify-content-center" style="gap: 10px; margin-top: 30px; margin-bottom: 30px;">
				<c:set var="pageNum" value="<%= pageNum %>"/>
				<c:forEach var="i"  begin="1" end="<%= total_page %>">
					<a href="./BoardListAction.do?pageNum=${i}">
						<c:choose>
							<c:when test="${pageNum == i}">
								<p class="text-dark"><b>[${i}]</b></p>
							</c:when>
							<c:otherwise>
								<p class="text-secondary">[${i}]</p>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div> --%>
		</div>
	</div>
</main>

<%@ include file="../step09/footer.jsp" %>

<script>
	function loginCheck() {
		<% if(sessionI == null) { %>
			alert("로그인을 먼저 확인해주세요.");
			location.href = "../sophomore_project_kimssam/user/loginMember.jsp";
		<% } %>
	}
</script>
</body>
</html>