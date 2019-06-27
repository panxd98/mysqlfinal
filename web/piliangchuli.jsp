<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/15
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>批量处理</title>
</head>
<body>
<ul>
    <li><p>
        <%
            String Name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/filemanage?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
                String user="root";
                String password="19980101";
                Connection conn= DriverManager.getConnection(url,user,password);
                System.out.println("连接成功");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(s);
                rs.next();
                String input[]=Name.split("\n");
                for (String in:input){
                    stmt.executeUpdate(in);


                }
                out.println("成功！");
        %>
        <a href="Main.jsp">返回</a>
        <%


            } catch (ClassNotFoundException ex){
                System.out.println("加载失败");
                ex.printStackTrace();
            }catch (SQLException ex){
                System.out.println("连接失败");
                ex.printStackTrace();
            }

        %>

    </p></li>

</ul>
</body>
</html>
