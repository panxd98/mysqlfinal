<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/7
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询数据</title>
</head>
<body>
<form action="successs.jsp" method="GET">
    <ul>
        <li><p>
            <%
                // 解决中文乱码的问题
                String Name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");

                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/filemanage?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
                    String user="root";
                    String password="19980101";
                    Connection conn= DriverManager.getConnection(url,user,password);
                    System.out.println("连接成功");
                    String sql="select * from "+Name;
                    PreparedStatement stmt=conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery(sql);
                    ResultSetMetaData data = rs.getMetaData();
                    for (int i = 1; i <= data.getColumnCount(); i++) {
                        String columnName = data.getColumnName(i);
                        out.println(columnName+" "+data.getColumnTypeName( i));
            %>

            <input type="text" name=<%=columnName%>><br/>
            <%
                    }
                }
                catch (ClassNotFoundException ex){
                    System.out.println("加载失败");
                    ex.printStackTrace();
                }catch (SQLException ex){
                    System.out.println("连接失败");
                    ex.printStackTrace();
                }

            %>

        </p></li>
    </ul>
    <input type="hidden" value="select *" name="do">
    <input type="hidden" value=<%=Name%> name="db" >
    <input type="submit" value="确认" /><br/>
</form>
</body>
</html>
