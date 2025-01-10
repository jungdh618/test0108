<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Starting with Korean Characters</title>
    <style>
        /* 전체 배경 색상 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9; /* 연한 브라운 톤 */
            color: #4e342e; /* 어두운 브라운 색상 */
            margin: 0;
            padding: 0;
            text-align: center;
        }

        /* 페이지 중앙에 정렬 */
        .container {
            width: 80%;
            max-width: 1000px;
            margin: 50px auto;
            background-color: #fff8f0; /* 따뜻한 아이보리 배경 */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 제목 스타일 */
        h1 {
            font-size: 36px;
            color: #6d4c41; /* 따뜻한 갈색 */
            margin-bottom: 30px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            text-align: left;
        }

        table th, table td {
            padding: 15px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #6d4c41; /* 따뜻한 갈색 */
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* 오류 메시지 스타일 */
        .error-message {
            color: red;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>도서 목록</h1>

        <!-- 책 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Sort</th>
                    <th>ISBN</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String jdbcUrl = "jdbc:mariadb://mariadb-master:3306/maindb?useUnicode=true&characterEncoding=UTF-8";  // DB 호스트, 포트, DB명
                    String dbUser = "root";  // DB 사용자 이름
                    String dbPassword = "root_password";  // DB 비밀번호

                    // 데이터베이스 연결
                    try {
                        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                        // 한글 초성 'ㄴ'으로 시작하는 책을 검색하는 쿼리
                        String query = "SELECT title, writer, sort, isbn FROM books WHERE title REGEXP '^[나-닣].*'";
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);

                        // 결과 처리 및 출력
                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            String writer = resultSet.getString("writer");
                            String sort = resultSet.getString("sort");
                            String isbn = resultSet.getString("isbn");
                %>
                            <tr>
                                <td><%= title %></td>
                                <td><%= writer %></td>
                                <td><%= sort %></td>
                                <td><%= isbn %></td>
                            </tr>
                <%
                        }

                        // 자원 해제
                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (SQLException e) {
                %>
                        <tr><td colspan="4" class="error-message">Error: <%= e.getMessage() %></td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

