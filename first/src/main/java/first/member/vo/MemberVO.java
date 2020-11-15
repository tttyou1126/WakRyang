package first.member.vo;

import java.sql.Timestamp;

public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Timestamp userRegdate; // java.sql.Timestamp  (Date는 시간표시가 안됨)
	private Timestamp userUpdatedate;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Timestamp getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}

	public Timestamp getUserUpdatedate() {
		return userUpdatedate;
	}

	public void setUserUpdatedate(Timestamp userUpdatedate) {
		this.userUpdatedate = userUpdatedate;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userRegdate=" + userRegdate + ", userUpdatedate=" + userUpdatedate + "]";
	}

}