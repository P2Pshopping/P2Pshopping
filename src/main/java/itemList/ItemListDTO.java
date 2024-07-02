package itemList;

public class ItemListDTO {
   private String username;
   private String imgUrl_1;
   private String productName;
   private String price;
   private String categoryid;
   
   public ItemListDTO() {}
   
   public ItemListDTO(String username, String imgUrl_1, String productName, String price, String categoryid) {
      super();
      this.username = username;
      this.imgUrl_1 = imgUrl_1;
      this.productName = productName;
      this.price = price;
      this.categoryid = categoryid;
   }
   
   
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public String getImgUrl_1() {
      return imgUrl_1;
   }
   public void setImgUrl_1(String imgUrl_1) {
      this.imgUrl_1 = imgUrl_1;
   }
   public String getProductName() {
      return productName;
   }
   public void setProductName(String productName) {
      this.productName = productName;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public String getCategoryid() {
      return categoryid;
   }
   public void setCategoryid(String categoryid) {
      this.categoryid = categoryid;
   }

}
