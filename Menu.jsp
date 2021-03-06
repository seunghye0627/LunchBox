<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>LunchBox</title>
    <style>
        .top {
            background-color: #E6E0DA;
        }
        .user-head {
            position:absolute;
            top: 10px;
            right: 10px;
        }
        .user-head .glyphicon {
            font-size: 25px;
            color : #C0262B;
        }
        .product{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .menu1 ul {
            background-color:#E6E0DA;
            text-align: center;
            border-top : 3px solid #C0262B;
            border-bottom: 3px solid #C0262B;
            padding: 10px;
        }
        ul li a:visited{
            color: #C0262B;
        }
        ul li {
            display: inline;
            padding: 20px;
        }
        ul li a {
            color: #C0262B;
            text-decoration: none;
        }
        ul li a:hover {
            color: #C0262B;
        }
        .menu2 {
            display:inline-block;
            border: 3px dashed #C0262B;
            padding-top: 10px;
            margin: 15px;
        }
        .menu2 ul{
            padding-left: 0px;
        }
        button {
            background-color: #ffffffff;
            border: none;
        }
        footer {
            background-color: #C0262Bd1;
            color: white;
        }
    </style>
</head>
<body>
<div class="container top">
    <nav class="navbar navbar-custom">
        <div class="row">
            <div class="col-xs-1"></div>
            <div class="col-xs-10 text-center">
                <a href="Menu.html"><img src="LunchBoxLogo.png" width="300"/></a>
            </div>
            <div class="col-md-1 user-head">
                <a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
            </div>
        </div>
    </nav>

    <div class="menu1">
        <ul>
            <li><a herf="#">주문</a></li>
            <li><a herf="Cart.html">장바구니</a></li>
            <li><a herf="Review.html">리뷰</a></li>
            <li><a herf="My.html">마이페이지</a></li>
        </ul>
    </div>
</div>

<div class="container text-center">
    <div class="menu2">
        <ul>
            <li><a href="#">밥</a></li>
            <li><a href="Banchan.jsp">반찬</a></li>
            <li><a href="Topping.jsp">토핑</a></li>
            <li><a href="Snack.jsp">간식</a></li>
        </ul>
    </div>
</div>

	

<%
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
   Statement stmt = conn.createStatement();
   String sqlstr = "SELECT * FROM food WHERE CategoryID = 4";
   stmt = conn.prepareStatement(sqlstr);
   ResultSet rset = stmt.executeQuery(sqlstr);
%>

<div class="container">    
    <div class="factor text-center">
        <row>
        <%while(rset.next())
        {%>
            <div class="col-xs-4 ">
			 <%
		   		String foodName = rset.getString("foodName");
		 		int foodPrice = rset.getInt("foodPrice");
				String foodImage = rset.getString("foodImage"); %>
				<img src = <%=foodImage %> width = "200px" height="auto" align="middle"><br/>
				<p><%= foodName  %></p>
		  		<p><%= foodPrice %></p>

                <div>
                <button><img src="select.png" width=40/></button>
                <button><img src="star.png" width=40 /></button>
                </div>
            </div>
            <%} %>
			
            </div>
        </row>
        
    </div>
    <%	rset.close();
		stmt.close();
		conn.close(); %>
    
    
    
<footer class="container">
  <row>
      <div class="col-md-8">
        <p>
            Project of Database System<br>
            Software department at Chungbuk National University with Professor Aziz.
        </p>
      </div>
      <div class="col-md-4">
          <p>
            이송이<br>
              <span class="
glyphicon glyphicon-envelope"> elephant890@naver.com</span>
          </p>
          <p>
            최승혜<br>
              <span class="
glyphicon glyphicon-envelope"> 승해 이메일 ^_^</span>
          </p>
          <p>
            이주영<br>
              <span class="
glyphicon glyphicon-envelope"> 영주 이메일 ^_^</span>
          </p>
      </div>
  </row>
</footer>
</body>
</html>