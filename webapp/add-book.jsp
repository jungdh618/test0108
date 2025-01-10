<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 추가</title>

    <style>
        /* 페이지 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f1f1; /* 연한 브라운 톤 */
            color: #4e342e; /* 어두운 브라운 색상 */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .container {
            background-color: #fff8f0; /* 따뜻한 아이보리 배경 */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 600px;
        }

        h1 {
            font-size: 32px;
            color: #6d4c41; /* 따뜻한 갈색 */
            margin-bottom: 30px;
            font-weight: normal;
        }

        input, button {
            font-size: 18px;
            padding: 12px 24px;
            margin: 10px 5px;
            border-radius: 25px;
            border: 1px solid #d4c4a1; /* 부드러운 브라운 테두리 */
            width: 100%;
        }

        button {
            background-color: #6d4c41; /* 진한 브라운 */
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #4e342e; /* 어두운 브라운 */
        }

        button:focus {
            outline: none;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #6d4c41; /* 메시지 텍스트 색상 */
        }

        .message a {
            color: #4e342e; /* 링크 색상 */
            text-decoration: none;
            font-weight: bold;
        }

        .message a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String sort = request.getParameter("sort");
    String isbn = request.getParameter("isbn");
    String message = "";

    // 도서 추가가 제출되었을 때 처리
    if (title != null && writer != null && sort != null && isbn != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // JDBC 연결
            String url = "jdbc:mariadb://mariadb-master:3306/maindb";  // Docker 환경에서 maindb로 접근
            String user = "root";  // MariaDB 사용자명
            String password = "root_password";  // MariaDB 비밀번호

                        // MariaDB JDBC 드라이버 로드
                        Class.forName("org.mariadb.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);

            // SQL 쿼리 작성
            String sql = "INSERT INTO books (title, writer, sort, isbn) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // 파라미터 설정
            pstmt.setString(1, title);
            pstmt.setString(2, writer);
            pstmt.setString(3, sort);
            pstmt.setString(4, isbn);

            // 쿼리 실행
            int result = pstmt.executeUpdate();

            if (result > 0) {
                message = "도서가 성공적으로 추가되었습니다!";
            } else {
                message = "도서 추가에 실패했습니다. 다시 시도해 주세요.";
            }
        } catch (SQLException e) {
            message = "SQL 오류 발생: " + e.getMessage();  // SQL 예외 메시지를 출력
            e.printStackTrace();  // 로그에 오류를 기록
        } catch (ClassNotFoundException e) {
            message = "JDBC 드라이버 로드 오류: " + e.getMessage();  // 드라이버 오류 메시지 출력
            e.printStackTrace();
        } catch (Exception e) {
            message = "예기치 못한 오류 발생: " + e.getMessage();  // 일반적인 예외 처리
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>

<div class="container">
    <h1>도서 추가</h1>

    <form method="POST" action="add-book.jsp">
        <div class="form-group">
            <input type="text" name="title" placeholder="도서 제목" required value="<%= title != null ? title : "" %>">
        </div>
        <div class="form-group">
            <input type="text" name="writer" placeholder="저자" required value="<%= writer != null ? writer : "" %>">
        </div>
        <div class="form-group">
            <input type="text" name="sort" placeholder="분류" required value="<%= sort != null ? sort : "" %>">
        </div>
        <div class="form-group">
            <input type="text" name="isbn" placeholder="ISBN" required value="<%= isbn != null ? isbn : "" %>">
        </div>
        <button type="submit">도서 추가</button>
    </form>

    <% if (!message.isEmpty()) { %>
        <div class="message">
            <p><%= message %></p>
            <a href="index.jsp">돌아가기</a>
        </div>
    <% } %>
</div>

</body>
</html>

