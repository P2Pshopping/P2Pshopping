package itemList;

import java.sql.Date;

public class ItemListDTO {
	private String productid;
	private String username;
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
	private Date createDate;
	private Date updateDate;
	private int visit;
	
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}

	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}

	
}
