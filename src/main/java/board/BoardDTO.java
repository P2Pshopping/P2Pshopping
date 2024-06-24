package board;

public class BoardDTO {
	private int id; // 글번호
	private int bno; // 카테고리번호
	private String writerId; // 작성자
	private String title;
	private String detail;
	private java.sql.Date createDate; // 등록 날짜
	private java.sql.Date updateDate; // 수정 날짜
	private String imgUrl_1;
	private String imgUrl_2;
	private String imgUrl_3;
	private String imgUrl_4;
	private int likes;// 추천수
	private int views; // 조회수
	private String pass; // 게시글 비밀번호 4자리

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public java.sql.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
	}

	public java.sql.Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.sql.Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getImgUrl_1() {
		return imgUrl_1;
	}

	public void setImgUrl_1(String imgUrl_1) {
		this.imgUrl_1 = imgUrl_1;
	}

	public String getImgUrl_2() {
		return imgUrl_2;
	}

	public void setImgUrl_2(String imgUrl_2) {
		this.imgUrl_2 = imgUrl_2;
	}

	public String getImgUrl_3() {
		return imgUrl_3;
	}

	public void setImgUrl_3(String imgUrl_3) {
		this.imgUrl_3 = imgUrl_3;
	}

	public String getImgUrl_4() {
		return imgUrl_4;
	}

	public void setImgUrl_4(String imgUrl_4) {
		this.imgUrl_4 = imgUrl_4;
	}

}
