<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/7
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <li><p>
        <%
            // 解决中文乱码的问题
            String be= new String((request.getParameter("do")).getBytes("ISO-8859-1"),"UTF-8");
            String Name= new String((request.getParameter("db")).getBytes("ISO-8859-1"),"UTF-8");

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
                String s=be+" "+Name+" where ";
                for (int i = 1; i <= data.getColumnCount(); i++){
                    String x=new String((request.getParameter(data.getColumnName(i))).getBytes("ISO-8859-1"),"UTF-8");
                    out.println(x);%><br/><%
                    if(!x.equals("")){
                        s=s+data.getColumnName(i)+"='"+x+"' and ";
                        //out.println(s);
                    }

                }
                s=s.substring(0,s.length()-4);
                out.println("你的操作为： ");
                out.println(s);%><br/><%
                if(stmt.executeUpdate(s)==1){
                    out.println("success!");%>
        <a href="Main.jsp">确认</a>
        <%
        }else{
            out.println("fail!");%>
        <a href="insert.jsp">返回</a>
        <%
            }

        }catch (SQLIntegrityConstraintViolationException a){
            out.println("fail!");%>
        <a href="Main.jsp">返回</a>
        <%
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
</body>
</html>
