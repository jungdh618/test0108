<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books</title>
    <style>
        /* 브라운 톤을 활용한 디자인 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f1f1; /* 연한 브라운 톤 */
            margin: 0;
            padding: 0;
            color: #4e342e; /* 어두운 브라운 색상 */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff8f0; /* 따뜻한 아이보리 색상 */
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #6d4c41; /* 진한 브라운 색상 */
            margin-bottom: 30px;
        }

        .alphabet-selector {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #d7ccc8; /* 밝은 브라운 색상 */
            background-color: #fff; /* 배경을 흰색으로 */
            color: #4e342e; /* 어두운 브라운 색상 */
            margin-right: 10px;
        }

        button {
            padding: 10px 20px;
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #3e2723; /* 어두운 브라운 색상 */
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a, .pagination span {
            padding: 8px 12px;
            margin: 5px;
            text-decoration: none;
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #3e2723; /* 어두운 브라운 색상 */
        }

        .pagination .disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #d7ccc8; /* 밝은 브라운 색상 */
            text-align: left;
        }

        th, td {
            padding: 12px;
        }

        th {
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
        }

        td a.delete-btn {
            color: #e64a19; /* 붉은 브라운 색상 */
            text-decoration: none;
            font-weight: bold;
            padding: 5px;
            border: 1px solid #e64a19;
            border-radius: 5px;
        }

        td a.delete-btn:hover {
            background-color: #e64a19; /* 붉은 브라운 색상 */
            color: white;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #3e2723; /* 어두운 브라운 색상 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>도서 목록</h1>

        <!-- 초성 선택 폼 -->
        <form action="allbooks.jsp" method="get" style="text-align: center;">
            <label for="search" style="font-size: 18px; color: #6d4c41;">초성을 선택하세요: </label>
            <select name="search" id="search" class="alphabet-selector">
                <option value="">초성 선택</option>
                <option value="ㄱ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㄱ") ? "selected" : "" %>>ㄱ</option>
                <option value="ㄴ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㄴ") ? "selected" : "" %>>ㄴ</option>
                <option value="ㄷ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㄷ") ? "selected" : "" %>>ㄷ</option>
                <option value="ㄹ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㄹ") ? "selected" : "" %>>ㄹ</option>
                <option value="ㅁ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅁ") ? "selected" : "" %>>ㅁ</option>
                <option value="ㅂ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅂ") ? "selected" : "" %>>ㅂ</option>
                <option value="ㅅ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅅ") ? "selected" : "" %>>ㅅ</option>
                <option value="ㅇ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅇ") ? "selected" : "" %>>ㅇ</option>
                <option value="ㅈ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅈ") ? "selected" : "" %>>ㅈ</option>
                <option value="ㅊ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅊ") ? "selected" : "" %>>ㅊ</option>
                <option value="ㅋ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅋ") ? "selected" : "" %>>ㅋ</option>
                <option value="ㅌ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅌ") ? "selected" : "" %>>ㅌ</option>
                <option value="ㅍ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅍ") ? "selected" : "" %>>ㅍ</option>
                <option value="ㅎ" <%= request.getParameter("search") != null && request.getParameter("search").equals("ㅎ") ? "selected" : "" %>>ㅎ</option>
            </select>
            <button type="submit">검색</button>
        </form>

        <!-- 책 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Sort</th>
                    <th>ISBN</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String jdbcUrl = "jdbc:mariadb://mariadb-master:3306/maindb?useUnicode=true&characterEncoding=UTF-8";
                    String dbUser = "root";
                    String dbPassword = "root_password";

                    String searchKeyword = request.getParameter("search"); // 선택된 초성
                    if (searchKeyword == null) {
                        searchKeyword = ""; // 기본값은 빈 문자열
                    }

                    int pageSize = 10;
                    int pageNum = 1;
                    String pageParam = request.getParameter("page");
                    if (pageParam != null && !pageParam.isEmpty()) {
                        try {
                            pageNum = Integer.parseInt(pageParam);
                        } catch (NumberFormatException e) {
                            pageNum = 1;
                        }
                    }

                    // 삭제 처리
                    String deleteIsbn = request.getParameter("deleteIsbn");
                    if (deleteIsbn != null && !deleteIsbn.isEmpty()) {
                        try {
                            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                            String deleteQuery = "DELETE FROM books WHERE isbn = ?";
                            PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery);
                            deleteStatement.setString(1, deleteIsbn);
                            deleteStatement.executeUpdate();
                            deleteStatement.close();
                            connection.close();
                            response.sendRedirect("allbooks.jsp?search=" + searchKeyword); // 삭제 후 새로고침
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='5' class='error-message'>Error deleting book: " + e.getMessage() + "</td></tr>");
                        }
                    }

                    int offset = (pageNum - 1) * pageSize;
                    int totalPages = 0;

                    try {
                        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                        // 초성 검색을 위한 정규식 쿼리 수정
                        String query = "SELECT title, writer, isbn, sort FROM books WHERE title REGEXP ? LIMIT ? OFFSET ?";
                        PreparedStatement statement = connection.prepareStatement(query);

                        // 초성별 유니코드 범위를 활용한 REGEXP 쿼리
                        String regex = "";
                        switch (searchKeyword) {
                            case "ㄱ": regex = "^[가-깋]"; break;
                            case "ㄴ": regex = "^[나-닣]"; break;
                            case "ㄷ": regex = "^[다-딯]"; break;
                            case "ㄹ": regex = "^[라-맇]"; break;
                            case "ㅁ": regex = "^[마-밯]"; break;
                            case "ㅂ": regex = "^[바-빯]"; break;
                            case "ㅅ": regex = "^[사-싯]"; break;
                            case "ㅇ": regex = "^[아-잇]"; break;
                            case "ㅈ": regex = "^[자-짛]"; break;
                            case "ㅊ": regex = "^[차-칳]"; break;
                            case "ㅋ": regex = "^[카-킿]"; break;
                            case "ㅌ": regex = "^[타-틿]"; break;
                            case "ㅍ": regex = "^[파-핗]"; break;
                            case "ㅎ": regex = "^[하-힣]"; break;
                            default: regex = "^[가-힣]"; break;
                        }

                        statement.setString(1, regex);
                        statement.setInt(2, pageSize);
                        statement.setInt(3, offset);
                        ResultSet resultSet = statement.executeQuery();

                        // 결과 처리 및 출력
                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            String writer = resultSet.getString("writer");
                            String isbn = resultSet.getString("isbn");
                            String sort = resultSet.getString("sort");
                %>
                            <tr>
                                <td><%= title %></td>
                                <td><%= writer %></td>
                                <td><%= sort %></td>
                                <td><%= isbn %></td>
                                <td>
                                    <a href="?deleteIsbn=<%= isbn %>" class="delete-btn">삭제</a>
                                </td>
                            </tr>
                <%
                        }

                        resultSet.close();
                        statement.close();

                        // 전체 책 수 조회 (페이지네이션을 위한 총 페이지 수 계산)
                        String countQuery = "SELECT COUNT(*) FROM books WHERE title REGEXP ?";
                        PreparedStatement countStatement = connection.prepareStatement(countQuery);
                        countStatement.setString(1, regex);

                        ResultSet countResultSet = countStatement.executeQuery();
                        int totalBooks = 0;
                        if (countResultSet.next()) {
                            totalBooks = countResultSet.getInt(1);
                        }
                        totalPages = (int) Math.ceil(totalBooks / (double) pageSize);

                        countResultSet.close();
                        countStatement.close();
                        connection.close();
                    } catch (SQLException e) {
                %>
                        <tr><td colspan="5" class="error-message">Error: <%= e.getMessage() %></td></tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <%
                if (pageNum > 1) {
                    out.println("<a href='?page=" + (pageNum - 1) + "&search=" + searchKeyword + "'>이전</a>");
                } else {
                    out.println("<span class='disabled'>이전</span>");
                }

                int startPage = Math.max(1, pageNum - 2);
                int endPage = Math.min(totalPages, pageNum + 2);

                for (int i = startPage; i <= endPage; i++) {
                    if (i == pageNum) {
                        out.println("<span>" + i + "</span>");
                    } else {
                        out.println("<a href='?page=" + i + "&search=" + searchKeyword + "'>" + i + "</a>");
                    }
                }

                if (pageNum < totalPages) {
                    out.println("<a href='?page=" + (pageNum + 1) + "&search=" + searchKeyword + "'>다음</a>");
                } else {
                    out.println("<span class='disabled'>다음</span>");
                }
            %>
        </div>

        <!-- 메인 페이지로 돌아가기 버튼 -->
        <a href="index.jsp" class="back-btn">메인 페이지로 돌아가기</a>
    </div>
</body>
</html>
