<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
    // jsp 영역
    request.setCharacterEncoding("utf-8");   // 전 페이지에서 온 데이터에 대해서 인코딩 설정
    String data = request.getParameter("data");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <h1>메인페이지 입니다</h1>
    <h2>받아온 값 : <%=data%></h2>

</body>
