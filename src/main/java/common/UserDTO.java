package common; // 기본 패키지 이외의 패키지 (규약 1번)

import java.security.Timestamp;

public class UserDTO {

	private int id; // 유저아이디(고유번호)
	private String name; // 본명
	private String birth; // 생년월일

	private String username; // 가입아이디
	private String email; // 이메일
	private String phone; // 휴대폰번호
	private String address; // 주소
	private String password; // 비밀번호
	private int kakaoId; // 카카오아이
	private int naverId; // 네이버아이디
	private int provinceId;// 도 (위치)
	private int cityId; // 시 (위치)
	private int districtId; // 동(위치)
	private String auth; // 권한부여
	private java.sql.Timestamp createDate; // 가입일자

	private int active; // 비활성
	private int productCount;
	private int likeCount;
	private int boardCount;

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public UserDTO() {
	}// 기본 생성자 (규약 3번)

	public UserDTO(int id, String name, String username,String birth, String email, String phone, String address, String password,
			int kakaoId, int naverId, int provinceId, int cityId, int districtId, String auth,java.sql.Timestamp createDate) {
		super();
		this.username = username;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birth=birth;
		this.address = address;
		this.password = password;
		this.kakaoId = kakaoId;
		this.naverId = naverId;
		this.provinceId = provinceId;
		this.cityId = cityId;
		this.districtId = districtId;
		this.auth = auth;
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(int kakaoId) {
		this.kakaoId = kakaoId;
	}

	public int getNaverId() {
		return naverId;
	}

	public void setNaverId(int naverId) {
		this.naverId = naverId;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public java.sql.Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Timestamp createDate) {
		this.createDate = createDate;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}