<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>    
<%@ include file="header.jsp" %>
	<%!
		DecimalFormat df = new DecimalFormat("#,###");
	%>
	<%
		String cartId = session.getId();//Jsession아이디 얻어옴
	%>
	
		<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	
	<!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) && sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                        </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
	
		<%-- <!-- .container>.row>.col-md-6>h3+p+p*4>b^h3+p -->
		<div class="container mt-5 pt-5">
			<div class="row">
				<table class="mb-5" width="100%">
					<tr>
						<td align="left">
							<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success" >주문</a>
						</td>
						<td align="right">
							<a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-info" >장바구니 일괄 비우기</a>
						</td>
					</tr>
				</table>
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">상품</th>
				      <th scope="col">가격</th>
				      <th scope="col">수량</th>
				      <th scope="col">소계</th>
				      <th scope="col">비고</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<%
				  		int sum = 0; //결제총액
				  		ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
				  		
				  		if(cartList == null) cartList = new ArrayList<Product>();
				  		
				  		for(int i=0; i<cartList.size(); i++){
				  			Product product = cartList.get(i);
				  			int total = product.getUnitPrice() * product.getQuantity();
				  			sum += total;
				  		
				  	%>
				    <tr>
				      <th scope="row"><%=product.getProductId() %> | <%=product.getPname() %></th>
				      <td><%=df.format(product.getUnitPrice()) %></td>
				      <td><%=product.getQuantity() %></td>
				      <td><%=df.format(total) %></td>
				      <td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="btn btn-danger">삭제</a></td>
				    </tr>
				    <%
				  		}
				    %>
				    <tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=df.format(sum)%></th> 
						<th></th>
					</tr>
				  </tbody>
				</table>
			</div>
		</div> --%>
	
	<%@ include file="footer.jsp" %>