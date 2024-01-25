<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- 데이터베이스 SQL 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%
    request.setCharacterEncoding("utf-8");   // 이전 페이지에서 온 값에 대한 인코딩 설정
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    // DB 연결 코드
    Class.forName("com.mysql.jdbc.Driver");   // Connector파일 찾아오는 명령어
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "stageus", "1234");

    // SQL 준비 및 전송
    String sql = "INSERT INTO account(id, pw) VALUES(?, ?)";
    PreparedStatement query = conn.prepareStatement(sql);   // SQL을 전송 대기 상태로 만든 것
    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.executeUpdate();   // DB에 전달
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        alert("<%=idValue%>" + "님의 회원가입이 성공하였습니다.")
        location.href="index.html"
    </script>
</body>