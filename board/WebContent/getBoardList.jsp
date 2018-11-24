<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ac.yongin.cs.board.dao.BoardDAO" %>
<%@ page import="ac.yongin.cs.board.vo.BoardVO" %>
<%
	BoardVO vo = new BoardVO();
	BoardDAO boardDao = new BoardDAO();
	List<BoardVO> boardList = boardDao.getBoardList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>글 목록</h2>
		<h3><%= (String) session.getAttribute("name") %>님 환영합니다<a href="logoutProc.jsp">Logout</a></h3>
		
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" width="700">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
						</select>
						<input name="searchKeyword" type="text"/>
						<input name="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
		
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<% for(BoardVO board : boardList) { %>
			<tr>
				<td><%= board.getSeq() %></td>
				<td align="left"><a href="getBoard.jsp?seq=<%= board.getSeq() %>"><%= board.getTitle() %></a></td>
				<td><%= board.getWriter() %></td>
				<td><%= board.getRegDate() %></td>
				<td><%= board.getCnt() %></td>
			</tr>
			<% } %>
		</table>
		
		<br>
		<a href="insertBoard.jsp">새글 등록</a>
	</div>
</body>
</html>