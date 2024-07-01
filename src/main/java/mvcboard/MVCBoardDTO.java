package mvcboard;

import java.sql.Date;

public class MVCBoardDTO {
    private String id;
    private int bno;
    private int writerId;
    private String username;
    private String title;
    private String content;
    private Date createDate;
    private Date updateDate;
    private String ofile;
    private String sfile;
    private int views;
    private int likes;

    
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }
<<<<<<< HEAD
=======

    public int getWriterId() {
        return writerId;
    }

    public void setWriterId(int writerId) {
        this.writerId = writerId;
    }
>>>>>>> refs/heads/master

    public int getWriterId() {
        return writerId;
    }

    public void setWriterId(int writerId) {
        this.writerId = writerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

<<<<<<< HEAD
    public String getContent() {
        return content;
=======
    public Date getCreateDate() {
        return createDate;
>>>>>>> refs/heads/master
    }

<<<<<<< HEAD
    public void setContent(String content) {
        this.content = content;
=======
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
>>>>>>> refs/heads/master
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

<<<<<<< HEAD
    public String getOfile() {
        return ofile;
=======
    public int getViews() {
        return views;
>>>>>>> refs/heads/master
    }

<<<<<<< HEAD
    public void setOfile(String ofile) {
        this.ofile = ofile;
=======
    public void setViews(int views) {
        this.views = views;
>>>>>>> refs/heads/master
    }

<<<<<<< HEAD
    public String getSfile() {
        return sfile;
=======
    public int getLikes() {
        return likes;
>>>>>>> refs/heads/master
    }

<<<<<<< HEAD
    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
}
=======
    public void setLikes(int likes) {
        this.likes = likes;
    }
}
>>>>>>> refs/heads/master
