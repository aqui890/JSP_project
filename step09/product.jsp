<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<%@ include file="connection.jsp" %>    
<%@ include file="header.jsp" %>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Single</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Single</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	<%
		java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
		String id = request.getParameter("id");
		String sql = "SELECT * FROM yemin_products WHERE p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			
/* 		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); */
	%>
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="../resources/images/<%= rs.getString("p_filename") %>"
							alt="" style="width: 100%; height: 100%; display: block;">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<!-- 상품명 -->
						<h3><%= rs.getString("p_name") %></h3>
						<!-- 상품 가격 -->
						<h2><%= df.format(Integer.parseInt(rs.getString("p_unitPrice")))%></h2>
						<!-- 카텍고리, 제고 수, 상품 상태 등 세부 사항 -->
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> : <%= rs.getString("p_category") %></a></li>
							<li><a href="#"><span>Availibility</span> : <%= rs.getString("p_unitStock") %></a></li>
						</ul>
						<!-- 상품 설명 -->
						<p style="margin-bottom: 30px;"><%= rs.getString("p_description") %></p>
						<% if(sessionId == null) { %>
							<a class="button info-btn" href="./products.jsp" style="margin-bottom: 30px;"> 상품 목록 &raquo;</a>
						<% } else { %>
							<a class="button info-btn" href="./products.jsp"> 상품 목록 &raquo;</a>
						<% } %>
						<%-- <form action="./addCart.jsp?id=<%=rs.getString("p_id") %>" name="addForm" method="post">
							<input class="btn btn-warning" onclick="addToCart()" value="장바구니에 담기 &raquo;">
							<a href="./cart.jsp" class="btn btn-primary">장바구니로 이동</a>
						</form> --%>
						<c:choose>
							<c:when test="${ sessionId != null }">
								<form action="./addCart.jsp?id=<%=rs.getString("p_id") %>" name="addForm" method="post">
									<input class="button primary-btn" onclick="addToCart()"
									style="margin-top: 30px; margin-bottom: 30px; width: 180px; cursor: pointer;"
									value="Add to Cart"/>
									<a class="button primary-btn" href="./cart.jsp">장바구니로 이동</a>
								</form>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
</main>
<%
		}
		if(rs !=null) rs.close();
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
%>
	
	<%@ include file="footer.jsp" %>
	<script>
		function addToCart(){
			if(confirm("상품을 장바구니에 추가하시겠습니까?")){
				document.addForm.submit();
			}else{
				document.addForm.reset();
			}
		}
	</script>
</body>
</html>