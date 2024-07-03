package itemList;

public class ItemListDTO {
	private int id;
	private String productName;
	private int categoryid;
	private int price;
	private String sold;
	private String detail;
	private String imgUrl_1;
	private String imgUrl_2;
	private String imgUrl_3;
	private String imgUrl_4;
	private int writerid;
	private java.sql.Date createDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSold() {
		return sold;
	}
	public void setSold(String sold) {
		this.sold = sold;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
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
	public int getWriterid() {
		return writerid;
	}
	public void setWriterid(int writerid) {
		this.writerid = writerid;
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
	private java.sql.Date updateDate;
	
}
