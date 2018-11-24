<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ac.yongin.cs.board.dao.BoardDAO" %>
<%@ page import="ac.yongin.cs.board.vo.BoardVO" %>
<%
	String seq = request.getParameter("seq");
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDao = new BoardDAO();
	BoardVO board = boardDao.getBoard(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>글 상세</h2>
		<a href="logoutProc.jsp">Logout</a>
		<hr>
		<form action="updateBoardProc.jsp" method="post">
			<input type="hidden" name="seq" value="<%= board.getSeq() %>" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text" value="<%= board.getTitle()%>"/></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left"><%= board.getWriter() %></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">
						<textarea name="content" cols="40" rows="10">
						<%= board.getContent() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left"><%= board.getRegDate() %></td>
				</tr>
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left"><%= board.getCnt() %></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="글수정"/></td>
				</tr>
			</table>
		</form>
		
		<hr>
		<a href="insertBoard.jsp">글등록</a>
		<a href="deleteBoardProc.jsp?seq=<%= board.getSeq() %>">글삭제</a>
		<a href="getBoardList.jsp">글목록</a>
	</div>
</body>
</html>