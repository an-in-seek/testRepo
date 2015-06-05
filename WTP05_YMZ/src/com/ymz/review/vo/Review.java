package com.ymz.review.vo;

import java.io.Serializable;
import java.util.List;

public class Review implements Serializable{
	
	private int reviewNo;
	private String title;
	private String regDate;
	private int hits;
	private String content;
	private int recommend;
	private String memberId;
	////////////////////////////////////////////// 참조용 변수들
	private String nickname;		// 회원 닉네임
	private int replyCount;			// 댓글 개수
	private int pageNo;
	private String sortType;		// 정렬 방식
	
	public Review(){
		
	}

	public Review(int reviewNo, String title, String regDate, int hits,
			String content, int recommend, String memberId, String nickname,
			int replyCount, int pageNo, String sortType) {
		super();
		this.reviewNo = reviewNo;
		this.title = title;
		this.regDate = regDate;
		this.hits = hits;
		this.content = content;
		this.recommend = recommend;
		this.memberId = memberId;
		this.nickname = nickname;
		this.replyCount = replyCount;
		this.pageNo = pageNo;
		this.sortType = sortType;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + hits;
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + pageNo;
		result = prime * result + recommend;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + replyCount;
		result = prime * result + reviewNo;
		result = prime * result
				+ ((sortType == null) ? 0 : sortType.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Review other = (Review) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (hits != other.hits)
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
		if (recommend != other.recommend)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (replyCount != other.replyCount)
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (sortType == null) {
			if (other.sortType != null)
				return false;
		} else if (!sortType.equals(other.sortType))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", title=" + title
				+ ", regDate=" + regDate + ", hits=" + hits + ", content="
				+ content + ", recommend=" + recommend + ", memberId="
				+ memberId + ", nickname=" + nickname + ", replyCount="
				+ replyCount + ", pageNo=" + pageNo + ", sortType=" + sortType
				+ "]";
	}

	
	

	
	
}
