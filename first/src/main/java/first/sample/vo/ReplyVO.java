package first.sample.vo;

import java.util.Date;

public class ReplyVO {
    private Integer replyidx;        // 댓글 번호
    private Integer IDX;        // 게시글 번호
    private String replytext;    // 댓글 내용
    private String replyer;        // 댓글 작성자
    private String userName;    // 댓글 작성자의 이름(회원의 이름)
    private Date regdate;        // 댓글 작성일자
    private Date updatedate;    // 댓글 수정일자
    private String secretReply;    // **댓글 숨김 유무 추가
    private String writer;        // **게시글의 작성자 추가
    
    // Getter/Setter
    public Integer getreidx() {
        return replyidx;
    }
    public void setreidx(Integer replyidx) {
        this.replyidx = replyidx;
    }
    public Integer getIDX() {
        return IDX;
    }
    public void setIDX(Integer IDX) {
        this.IDX = IDX;
    }
    public String getReplytext() {
        return replytext;
    }
    public void setReplytext(String replytext) {
        this.replytext = replytext;
    }
    public String getReplyer() {
        return replyer;
    }
    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public Date getUpdatedate() {
        return updatedate;
    }
    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }
    
	public Integer getReplyidx() {
		return replyidx;
	}
	public void setReplyidx(Integer replyidx) {
		this.replyidx = replyidx;
	}
	public String getSecretReply() {
		return secretReply;
	}
	public void setSecretReply(String secretReply) {
		this.secretReply = secretReply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyidx=" + replyidx + ", IDX=" + IDX + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", userName=" + userName + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secretReply="
				+ secretReply + ", writer=" + writer + "]";
	}

    
    
}
