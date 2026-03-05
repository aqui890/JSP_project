<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>

<%-- <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%> --%>

<%@ include file="connection.jsp" %>

<%= application.getRealPath("/img") %>

<%
	request.setCharacterEncoding("UTF-8");
	String filename = "";
	
	String realFolder = application.getRealPath("/resources/images/"); 
	String encType = "utf-8"; //인코딩 타입
	//최대파일용량 설정
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	//문자열 데이터를 정수로 변환
	Integer price;
	if(unitPrice.isEmpty()) price=0;
	else price = Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty()) stock=0;
	else stock= Long.valueOf(unitsInStock);
	
	//MultipartRequest 객체의 메소드를 활용해서 file type을 가진 파일 이름을 얻어옴
	Enumeration files = multi.getFileNames();
	//type="file"속성을 가진 파라미터의 이름을 Enumeration형식으로 리턴
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "INSERT INTO yemin_products VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	/* Product newProduct = new Product(); */
	pstmt.setString(1, productId);
	pstmt.setString(2, pname);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);		
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	response.sendRedirect("products.jsp");
	
%>    
