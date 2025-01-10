<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>도서 정보 보기</title>

    <style>
        /* 페이지 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif; /* 차분한 서체 */
            background-color: #f1f1f1; /* 연한 브라운 톤 */
            color: #4e342e; /* 어두운 브라운 색상 */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 높이에 맞춰서 내용이 중앙에 배치됨 */
            position: relative; /* 도서 추가 버튼 위치를 위한 설정 */
        }

        .container {
            background-color: #fff8f0; /* 따뜻한 아이보리 배경 */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
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

        button {
            font-size: 18px;
            background-color: #f0e4d7; /* 밝은 베이지 색 */
            border: 1px solid #d4c4a1; /* 부드러운 베이지 색의 테두리 */
            color: #4e342e; /* 어두운 브라운 색상 */
            padding: 12px 24px;
            margin: 10px 5px;
            border-radius: 25px; /* 둥근 버튼 */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease; /* 부드러운 전환 효과 */
        }

        button:hover {
            background-color: #d4c4a1; /* 마우스 오버 시 색 변경 */
            transform: scale(1.05); /* 약간 확대되는 효과 */
        }

        button:focus {
            outline: none; /* 클릭 시 테두리 제거 */
        }

        /* 도서 추가 버튼 스타일 */
        .add-book-btn {
            position: absolute;
            bottom: 20px; /* 아래에서 20px 위치 */
            right: 20px;  /* 오른쪽에서 20px 위치 */
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
            font-size: 20px;
            padding: 15px 25px;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 그림자 */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .add-book-btn:hover {
            background-color: #4e342e; /* 어두운 브라운 색상 */
            transform: scale(1.1); /* 버튼 크기 확대 */
        }

        .add-book-btn:focus {
            outline: none;
        }

        /* 도서 삭제 버튼 스타일 */
        .delete-book-btn {
            position: absolute;
            bottom: 20px; /* 아래에서 20px 위치 */
            left: 20px;  /* 왼쪽에서 20px 위치 */
            background-color: #6d4c41; /* 진한 브라운 색상 */
            color: white;
            font-size: 20px;
            padding: 15px 25px;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 그림자 */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .delete-book-btn:hover {
            background-color: #4e342e; /* 어두운 브라운 색상 */
            transform: scale(1.1); /* 버튼 크기 확대 */
        }

        .delete-book-btn:focus {
            outline: none;
        }

    </style>

</head>
<body>

    <div class="container">
        <h1>AKCL 도서 정보 보기</h1>

        <!-- 알파벳 버튼들 -->
        <button onclick="window.location.href='index2.jsp'">ㄱ</button>
        <button onclick="window.location.href='index3.jsp'">ㄴ</button>
        <button onclick="window.location.href='index4.jsp'">ㄷ</button>
        <button onclick="window.location.href='index5.jsp'">ㄹ</button>
        <button onclick="window.location.href='index6.jsp'">ㅁ</button>
        <button onclick="window.location.href='index7.jsp'">ㅂ</button>
        <button onclick="window.location.href='index8.jsp'">ㅅ</button>
        <button onclick="window.location.href='index9.jsp'">ㅇ</button>
        <button onclick="window.location.href='index10.jsp'">ㅈ</button>
        <button onclick="window.location.href='index11.jsp'">ㅊ</button>
        <button onclick="window.location.href='index12.jsp'">ㅋ</button>
        <button onclick="window.location.href='index13.jsp'">ㅌ</button>
        <button onclick="window.location.href='index14.jsp'">ㅍ</button>
        <button onclick="window.location.href='index15.jsp'">ㅎ</button>
    </div>

    <!-- 도서 추가 버튼 -->
    <button class="add-book-btn" onclick="window.location.href='add-book.jsp'">추가</button>

    <!-- 도서 삭제 버튼 -->
    <button class="delete-book-btn" onclick="window.location.href='delete-book.jsp'">삭제</button>

</body>
</html>

