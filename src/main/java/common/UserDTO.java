package common; // 기본 패키지 이외의 패키지 (규약 1번)

public class UserDTO {
	private int id;	//	private 멤버 변수(규약 2번)
	private String username;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String password;
	private int kakaoId;
	private int naverId;
	private int provinceId;
	private int cityId;
	private int districtId;
	private String auth;
	private String createDate;

	public UserDTO() {
	}// 기본 생성자 (규약 3번)

	public UserDTO(int id, String username, String name, String email, String phone, String address, String password,
			int kakaoId, int naverId, int provinceId, int cityId, int districtId, String auth,String createDate) {
		super();
		this.username = username;
		this.name = name;
		this.email = email;
		this.phone = phone;
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

	
	// public 게터/세터 메서드들(규약 4번, 5번)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
