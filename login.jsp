<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%-- Table에서 가져온 값을 처리하는 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>
<%-- List 라이브러리 --%>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("utf-8");  
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    // DB 연결 코드
    Class.forName("com.mysql.jdbc.Driver");   
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "stageus", "1234");

    // SQL 준비 및 전송
    String sql = "SELECT * FROM account WHERE id=? AND pw=?";
    PreparedStatement query = conn.prepareStatement(sql);   
    query.setString(1, idValue);
    query.setString(2, pwValue);

    // SQL 결과 받아오기
    ResultSet result = query.executeQuery();   

    // 후처리 ( ResultSet을 JSP 내에서 모두 읽은 다음에, 2차원 리스트로 만들어줄 것 )
    // result.next() 명령어가 cursor를 한 줄 움직이는 명령어
    ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
    while(result.next()) {
        String id = result.getString(1);   // 첫 번째 Column 읽어오기
        String pw = result.getString(2);   // 두 번째 Column 읽어오기

        // 1차원 리스트를 만들고, id와 pw를 넣어주는 것
        ArrayList<String> elem = new ArrayList<String>();
        elem.add("\"" + id + "\"");
        elem.add("\"" + pw + "\"");

        // 만든 1차원 리스트를, 2차원 리스트에 넣어주는 것
        data.add(elem);

        // 사실 문법이 어려운 것이지, JS에서 2차원 List 만드는 것과 동일한 로직임
    }

    // var tmpList = []   // js에서의 list
    // ArrayList<String> tmpList = new ArrayList<String>()   // java에서의 list
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var data = <%=data%>   // jsp 변수를 js 변수로 담아주기
        for (var index = 0; index<data.length; index++) {
            console.log(data[index])
        }
    </script>
</body>