<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/7
  Time: 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除数据</title>
</head>
<body>
<%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/filemanage?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
        String user="root";
        String password="19980101";
        Connection conn= DriverManager.getConnection(url,user,password);
        System.out.println("连接成功");
        DatabaseMetaData md = conn.getMetaData();
        ResultSet rs = md.getTables("filemanage", null, "%", null);
        List<String> l=new ArrayList<>();
        while (rs.next()) {
            l.add(rs.getString(3));
        }
        for(int i=0;i<l.size();i++){
            out.println(l.get(i));%><br/><%
        }

        ResultSetMetaData data = rs.getMetaData();
        for(int i=0;i<data.getColumnCount();i++){
            out.println(data.getColumnName(i));
        }

    }catch (ClassNotFoundException ex){
        System.out.println("加载失败");
        ex.printStackTrace();
    }catch (SQLException ex){
        System.out.println("连接失败");
        ex.printStackTrace();
    }
%>
<br/>
<form action="del.jsp" method="GET">
    输入操作的数据库：<input type="text" name="name">
    <input type="submit" value="确认" /><br/>
</form>
</body>
</html>
