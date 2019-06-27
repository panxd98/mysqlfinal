<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/7
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<%
    String Name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
    String Password=request.getParameter("password");
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/filemanage?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
        String user="root";
        String password="19980101";
        Connection conn= DriverManager.getConnection(url,user,password);
        System.out.println("连接成功");
        Statement stmt=conn.createStatement();
        String sql="insert into manageinfo(name,password) values('"+Name+"','"+Password+"')";
        if(stmt.executeUpdate(sql)==1){
            out.println("注册成功！");
        %><br/>
        <a href="Main.jsp">确认</a>
        <%
        }else{
            out.println("注册失败！");
    %><br/>
    <a href="Registered.jsp">确认</a>
    <%
        }
    }catch (ClassNotFoundException ex){
        System.out.println("加载失败");
        ex.printStackTrace();
    }catch (java.sql.SQLIntegrityConstraintViolationException jss){
            out.println("注册失败！");
    %><br/>
<a href="Registered.jsp">确认</a>
<%
    }catch (SQLException ex){
        System.out.println("连接失败");
        ex.printStackTrace();
    }

%>
<body>

</body>
</html>
