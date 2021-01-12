package user;

public class User {
	
	private String userPassword;
	private String userPasswordchk;
	private String userName;

	
	//마우스 우클릭 후 Source -> Generate Getters and Setters... -> Select All     객체 생성을 위함
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPasswordchk() {
		return userPasswordchk;
	}
	public void setUserPasswordchk(String userPasswordchk) {
		this.userPasswordchk = userPasswordchk;
	}
}
