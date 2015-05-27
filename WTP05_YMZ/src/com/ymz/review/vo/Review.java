package com.ymz.review.vo;

import java.io.Serializable;
import java.util.List;

import com.ymz.member.vo.Member;

public class Review implements Serializable{
	
	private int number;
	private String title;
	private String regDate;
	private int hits;
	private String content;
	private int recommend;
	private Member memberId;
	/* 사진 관련*/
	private String pictureName;
	private List upfile; // 파일정보를 담을 변수 (같은 이름으로 여러개가 넘어올때 List 사용)
	
	public Review(){
		
	}

	// 사진 X 생성자
	public Review(int number, String title, String regDate, int hits,
			String content, int recommend, Member memberId) {
		super();
		this.number = number;
		this.title = title;
		this.regDate = regDate;
		this.hits = hits;
		this.content = content;
		this.recommend = recommend;
		this.memberId = memberId;
	}
	
	// 사진 O 생성자
	public Review(int number, String title, String regDate, int hits,
			String content, int recommend, Member memberId, String pictureName,
			List upfile) {
		super();
		this.number = number;
		this.title = title;
		this.regDate = regDate;
		this.hits = hits;
		this.content = content;
		this.recommend = recommend;
		this.memberId = memberId;
		this.pictureName = pictureName;
		this.upfile = upfile;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
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

	public Member getMemberId() {
		return memberId;
	}

	public void setMemberId(Member memberId) {
		this.memberId = memberId;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public List getUpfile() {
		return upfile;
	}

	public void setUpfile(List upfile) {
		this.upfile = upfile;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + hits;
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + number;
		result = prime * result
				+ ((pictureName == null) ? 0 : pictureName.hashCode());
		result = prime * result + recommend;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((upfile == null) ? 0 : upfile.hashCode());
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
		if (number != other.number)
			return false;
		if (pictureName == null) {
			if (other.pictureName != null)
				return false;
		} else if (!pictureName.equals(other.pictureName))
			return false;
		if (recommend != other.recommend)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (upfile == null) {
			if (other.upfile != null)
				return false;
		} else if (!upfile.equals(other.upfile))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Review [number=" + number + ", title=" + title + ", regDate="
				+ regDate + ", hits=" + hits + ", content=" + content
				+ ", recommend=" + recommend + ", memberId=" + memberId
				+ ", pictureName=" + pictureName + ", upfile=" + upfile + "]";
	}

	

	
}
