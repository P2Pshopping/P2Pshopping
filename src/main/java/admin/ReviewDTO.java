package admin;

public class ReviewDTO {
    private int id;
//    private int sellerId;
//    private int buyerId;
//    private int productId;
    private String title;
    private int rating;
    private java.sql.Timestamp createDate;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public java.sql.Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.sql.Timestamp timestamp) {
        this.createDate = timestamp;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
