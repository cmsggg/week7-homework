<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%-- 데이터 받아오기 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>

<%-- 리스트 라이브러리 --%>
<%@ page import="java.util.ArrayList" %>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/web", "stageus", "1234");

    String sql = "SELECT * FROM account";
    PreparedStatement query = connect.prepareStatement(sql);

    ResultSet result = query.executeQuery();

    // 데이터 정제
    ArrayList<String> idList = new ArrayList<String>();
    ArrayList<String> pwList = new ArrayList<String>();
    while (result.next()) {
        String id = result.getString(1);
        String pw = result.getString(2);
        idList.add("\"" + id + "\"");
        pwList.add("\"" + pw + "\"");
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <script>
        var idList = <%=idList%>
        var pwList = <%=pwList%>

        console.log(idList)
        console.log(pwList)
    </script>

</body>
