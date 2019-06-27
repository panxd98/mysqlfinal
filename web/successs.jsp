<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: panxd
  Date: 2019/6/8
  Time: 8:37
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
                ResultSetMetaData metaData = rs.getMetaData();
                ResultSetMetaData rss = rs.getMetaData();
                int columnCount = rss.getColumnCount();
                ResultSetMetaData data = rs.getMetaData();
                String s=be+" from "+Name+" where ";


        //s=s.substring(0,s.length()-4);
        //out.println("你的操作为： ");
        //out.println(s);%><br/><%
        //out.println("columnNum\t");
        for(int i = 1;i<=columnCount; i++){
            String f=rss.getColumnName(i);
            out.println(""+f+"\t");
            String x=new String((request.getParameter(f)).getBytes("ISO-8859-1"),"UTF-8");
            //System.out.println("success!1");
            System.out.println(x);
            if(!x.equals("")) {
                s = s+f+"= "+x+" "+"and   ";
            }
        }%><br/><%
        s=s.substring(0,s.length()-6);
        System.out.println(s);%><br/><%
        PreparedStatement pstmt = conn.prepareStatement(s);
        rs = pstmt.executeQuery();
        int col = rs.getMetaData().getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= col; i++) {
                out.print(rs.getString(i) +"&nbsp"+"&nbsp"+"&nbsp"+"&nbsp");
                if(rs.getString(i).length()==1)
                    out.println("&nbsp"+"&nbsp"+"&nbsp");
                if(rs.getString(i).length()==2)
                    out.println("&nbsp");
                if(rs.getString(i).length()==4)
                    out.println("&nbsp");
                if(i==4||i==5) {
                    if (rs.getString(i).length() == 3)
                        out.println("&nbsp&nbsp&nbsp");
                    if (rs.getString(i).length() == 2)
                        out.println("&nbsp&nbsp&nbsp&nbsp");
                }
                if ((i == 2) && (rs.getString(i).length() < 8)) {
                    out.print("\t");
                }

            }
            out.println("");
    %><br/><%
        }
        %><br/>
        <a href="Main.jsp">返回</a>
        <%
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
