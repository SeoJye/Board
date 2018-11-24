<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ac.yongin.cs.user.dao.UserDAO" %>
<%@ page import = "ac.yongin.cs.board.vo.UserVO" %>
<%@ page import = "java.util.List" %>
<%
	UserDAO dao = new UserDAO();
	List<UserVO> users = dao.getUserList();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1" cellpadding = "0" cellspacing = "0" width = " 400">
		<tr>
			<th>Id</th>
			<th>Password</th>
			<th>Name</th>
			<th>Role</th>
		</tr>
		<% for(UserVO vo : users) { %>
			<tr>
				<td><%= vo.getId() %></td>
				<td><%= vo.getPassword() %>
				<td><%= vo.getName() %></td>
				<td><%= vo.getRole() %></td>
			</tr>
		<% } %>
	</table>
</body>
</html>