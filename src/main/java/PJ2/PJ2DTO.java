package PJ2;

public class PJ2DTO {
	private String imgUrl_1;
	private String imgUrl_2;
	private String imgUrl_3;
	private String imgUrl_4;
	private String productName;
	private String detail;
	private int price;
	private String[] moreid; // 추가적으로 보여주는 글의 id
	private String likeSearch;	
	private String favorite[];
	private String favoriteimg[];
	private String writerid;
	private String favoritename[];
	private int favoriteprice[];

	private int favoritenum[];
	
	
	public int[] getFavoritenum() {
		return favoritenum;
	}
	public void setFavoritenum(int[] favoritenum) {
		this.favoritenum = favoritenum;

// 	private int userid;
	
	
// 	public int getUserid() {
// 		return userid;
// 	}
// 	public void setUserid(int userid) {
// 		this.userid = userid;

	}
	public int[] getFavoriteprice() {
		return favoriteprice;
	}
	public void setFavoriteprice(int[] favoriteprice) {
		this.favoriteprice = favoriteprice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	public String[] getFavoriteimg() {
		return favoriteimg;
	}
	public void setFavoriteimg(String[] favoriteimg) {
		this.favoriteimg = favoriteimg;
	}
	public String[] getFavoritename() {
		return favoritename;
	}
	public void setFavoritename(String[] favoritename) {
		this.favoritename = favoritename;
	}
	
	
	public String[] getFavorite() {
		return favorite;
	}
	public void setFavorite(String[] favorite) {
		this.favorite = favorite;
	}
	public String getLikeSearch() {
		return likeSearch;
	}
	public void setLikeSearch(String likeSearch) {
		this.likeSearch = likeSearch;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String address;
	
	
	
	public String[] getMoreid() {
		return moreid;
	}
	public void setMoreid(String[] moreid) {
		this.moreid = moreid;
	}
	private String[] f; 

	

	public String[] getF() {
		return f;
	}
	public void setF(String[] f) {
		this.f = f;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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

}
