	package com.ymz.reviewreply.vo;

import java.io.Serializable;

/**
 * @author 쭈욘
 *
 */
public class ReviewReply implements Serializable{

	private int replyNo;
	private String regDate;
	private String content;
	private String memberId;
	private int reviewNo;
	private int pageNo;
	private String nickname;
	
	
	public ReviewReply(){ 	}


	public ReviewReply(int replyNo, String regDate, String content,
			String memberId, int reviewNo, int pageNo, String nickname) {
		super();
		this.replyNo = replyNo;
		this.regDate = regDate;
		this.content = content;
		this.memberId = memberId;
		this.reviewNo = reviewNo;
		this.pageNo = pageNo;
		this.nickname = nickname;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public int getPageNo() {
		return pageNo;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + pageNo;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + replyNo;
		result = prime * result + reviewNo;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewReply other = (ReviewReply) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (pageNo != other.pageNo)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (replyNo != other.replyNo)
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "ReviewReply [replyNo=" + replyNo + ", regDate=" + regDate
				+ ", content=" + content + ", memberId=" + memberId
				+ ", reviewNo=" + reviewNo + ", pageNo=" + pageNo
				+ ", nickname=" + nickname + "]";
	}
	
	
	

}
