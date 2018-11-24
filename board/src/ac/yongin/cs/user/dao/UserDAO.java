package ac.yongin.cs.user.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import ac.yongin.cs.board.vo.UserVO;
import ac.yongin.cs.common.JDBCUtil;

//@Repository("userDAO")
public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public UserVO getUser(String id, String password) throws SQLException{
		String query = "select * from users where id = ? and password = ?";
		UserVO user = null;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1,  id);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPsssword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getInt("ROLE"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return user;
	}
	
	public UserVO getUser(UserVO vo) throws SQLException{
		String query = "select * from users where id = ? and password = ?";
		UserVO user = null;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1,  vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPsssword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getInt("ROLE"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return user;
	}
	
	public List<UserVO> getUserList() throws SQLException{
		List<UserVO> users = new ArrayList<UserVO>();
		String query = "select * from users";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				UserVO vo = new UserVO();
				vo.setId(rs.getString("id"));
				vo.setPsssword(rs.getString("password"));
				vo.setName(rs.getString("name"));
				vo.setRole(rs.getInt("role"));
				users.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return users;
	}
	
	public int login(String id, String password) throws SQLException{
		String query = "select password from users where id = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("password").equals(password)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return -2; // 데이터베이스 오류
	}
}