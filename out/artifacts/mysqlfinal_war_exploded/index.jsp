<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/5
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>金融贷款保险系统</title>
  </head>
  <body bgcolor="aqua">
  <img src="image/2.jpg"><br/>
  <%
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      String url="jdbc:mysql://localhost:3306/filemanage?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
      String user="root";
      String password="19980101";
      Connection conn= DriverManager.getConnection(url,user,password);
      System.out.println("连接成功");

    }catch (ClassNotFoundException ex){
      System.out.println("加载失败");
      ex.printStackTrace();
    }catch (SQLException ex){
      System.out.println("连接失败");
      ex.printStackTrace();
    }
  %>
  金融贷款保险系统<br/>
  <form action="login.jsp" method="GET">
    用户: <input type="text" name="name">
    <br />
    密码: <input type="text" name="password" />
    <input type="submit" value="登入" /><br/>
    <a href="Registered.jsp" >注册</a>
  </form>
  </body>
</html>
