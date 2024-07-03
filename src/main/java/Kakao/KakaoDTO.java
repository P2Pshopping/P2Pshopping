package Kakao;

public class KakaoDTO {
	 private int kakaoId;
	 private String username;
	 private String password;
		private java.sql.Timestamp createDate; 	//가입일자

	 public KakaoDTO() {

	 }
	 public KakaoDTO(int kakaoId,String username,String password,java.sql.Timestamp createDate) {
		 super();
		 this.kakaoId = kakaoId;
		 this.username = username;
		 this.password = password;
		 this.createDate = createDate;
	 }
	public int getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(int kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public java.sql.Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Timestamp createDate) {
		this.createDate = createDate;
	}


}
