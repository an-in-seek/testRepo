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
	
	public Review(){
		
	}

	public Review(int reviewNo, String title, String regDate, int hits,
			String content, int recommend, String memberId) {
		super();
		this.reviewNo = reviewNo;
		this.title = title;
		this.regDate = regDate;
		this.hits = hits;
		this.content = content;
		this.recommend = recommend;
		this.memberId = memberId;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + hits;
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + recommend;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + reviewNo;
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
		if (recommend != other.recommend)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (reviewNo != other.reviewNo)
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
				+ memberId + "]";
	}
	
	


	
	
}
