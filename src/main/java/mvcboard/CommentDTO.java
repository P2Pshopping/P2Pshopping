package mvcboard;

import java.sql.Date;

public class CommentDTO {
	private int cm_id;
	private String cm_board;
	private String cm_writerId;
	private Date cm_createDate;
	private String cm_content;
	private String cm_writerName;

	public String getCm_writerName() {
		return cm_writerName;
	}

	public void setCm_writerName(String cm_writerName) {
		this.cm_writerName = cm_writerName;
	}

	public int getCm_id() {
		return cm_id;
	}

	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}

	public String getCm_board() {
		return cm_board;
	}

	public void setCm_board(String cm_board) {
		this.cm_board = cm_board;
	}

	public String getCm_writerId() {
		return cm_writerId;
	}

	public void setCm_writerId(String cm_writerId) {
		this.cm_writerId = cm_writerId;
	}

	public Date getCm_createDate() {
		return cm_createDate;
	}

	public void setCm_createDate(Date cm_createDate) {
		this.cm_createDate = cm_createDate;
	}

	public String getCm_content() {
		return cm_content;
	}

	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}

}
