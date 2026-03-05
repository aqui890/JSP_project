<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="./header.jsp" %>
	<%@ include file="./connection.jsp" %>
	<%@ page import="java.util.ArrayList"%>
	
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
          <!-- Start Filter Bar -->
          
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row" style="width: 100%;">
            	<%
            		response.setCharacterEncoding("UTF-8");
            		java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
            		String sql="SELECT * FROM yemin_products";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						System.out.println(rs.getString("p_name"));
            	%>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img" style="box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); ">
                    <!-- 출력 이미지 -->
                    <img class="card-img" src="../resources/images/<%= rs.getString("p_filename") %>"
                    alt="<%= rs.getString("p_filename") %>" style="width: 350px; height: 325px; object-fit: cover;">
                    
                    <ul class="card-product__imgOverlay">
                      <!-- 장바구니에 담기 버튼 -->
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <!-- 카테고리 -->
                    <p><%= rs.getString("p_category") %></p>
                    <!-- 상품 이름 -->
                    <h4 class="card-product__title">
                    	<a href='./product.jsp?id=<%= rs.getString("p_id") %>'>
                    		<%= rs.getString("p_name") %>
                    	</a>
                    </h4>
                    <!-- 상품 가격 -->
                    <p class="card-product__price"><%= df.format(Integer.parseInt(rs.getString("p_unitPrice"))) %>원</p>
                  </div>
                </div>
              </div>
              <% }
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
				%>
            </div>
          </section>
          <!-- End Best Seller -->
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->
	<%@ include file="./footer.jsp" %>