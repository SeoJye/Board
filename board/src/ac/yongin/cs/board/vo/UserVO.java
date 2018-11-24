package ac.yongin.cs.board.vo;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private int role;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPsssword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	public String toString() {
		return "UserVO [ id = " + id + ", password = " + password + ", name = " + name + ", role = " + role + " ]";
	}
}