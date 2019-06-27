<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/7
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入</title>
</head>
<body>
<form action="Main.jsp" method="GET">
<ul>
    <li><p>
        <%
            String Name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
            String Password=request.getParameter("password");
            String s="select password from manageinfo where name='"+Name+"'";
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
                if(Password.equals(rs.getString("password"))){
                    out.println("登入成功！");%><br/><%
                    s="select bankName from managerinfo natural join bankinfo where name='"+Name+"'";
                    rs=stmt.executeQuery(s);
                    rs.next();
                    String ss=rs.getString("bankName");
                    if(ss.equals("root"))
                        ss="太XX保险公司 0";
                    if(ss.equals("BOA"))
                        ss=ss+" 1";
                    if(ss.equals("BCM"))
                        ss=ss+" 2";
                    if(ss.equals("BOC"))
                        ss=ss+" 3";
                    if(ss.equals("CCB"))
                        ss=ss+" 4";
                    if(ss.equals("ICBC"))
                        ss=ss+" 5";
                    out.println("你的权限为："+ss);
                    %><br/>
                    <input type="hidden" value=<%=ss%> name="root">
                    <a href="Main.jsp">确认</a>
                    <%
                }else{
                    out.println("密码错误！");
                    %><br/>
                    <a href="index.jsp">确认</a>
                    <%
                }
            } catch (ClassNotFoundException ex){
                System.out.println("加载失败");
                ex.printStackTrace();
            }catch (SQLException ex){
                System.out.println("连接失败");
                out.println("用户名不存在！");
                ex.printStackTrace();
                    %><br/>
        <a href="index.jsp">确认</a>
        <%
            }

        %>

    </p></li>

</ul>


</form>
</body>
</html>
