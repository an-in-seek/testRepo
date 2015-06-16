package com.ymz.review.vo;

import java.io.Serializable;
import java.util.List;

public class Review implements Serializable{
	
	private int reviewNo;
	private String category;
	private String title;
	private String regDate;
	private int hits;
	private String content;
	private int recommend;
	private int report;             // 비추천수
	private String memberId;
	////////////////////////////////////////////// 참조용 변수들
	private String nickname;		// 회원 닉네임
	private int replyCount;			// 댓글 개수
	private int pageNo = 1;				// 페이지 번호
	private String sortType;		// 정렬 방식
	private String searchType;		// 검색 방식
	private String query;			// 검색어
	
	public Review(){
		
	}

	public Review(int reviewNo, String category, String title, String regDate,
			int hits, String content, int recommend, int report,
			String memberId, String nickname, int replyCount, int pageNo,
			String sortType, String searchType, String query) {
		super();
		this.reviewNo = reviewNo;
		this.category = category;
		this.title = title;
		this.regDate = regDate;
		this.hits = hits;
		this.content = content;
		this.recommend = recommend;
		this.report = report;
		this.memberId = memberId;
		this.nickname = nickname;
		this.replyCount = replyCount;
		this.pageNo = pageNo;
		this.sortType = sortType;
		this.searchType = searchType;
		this.query = query;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + hits;
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + pageNo;
		result = prime * result + ((query == null) ? 0 : query.hashCode());
		result = prime * result + recommend;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + replyCount;
		result = prime * result + report;
		result = prime * result + reviewNo;
		result = prime * result
				+ ((searchType == null) ? 0 : searchType.hashCode());
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
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
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
		if (query == null) {
			if (other.query != null)
				return false;
		} else if (!query.equals(other.query))
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
		if (report != other.report)
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (searchType == null) {
			if (other.searchType != null)
				return false;
		} else if (!searchType.equals(other.searchType))
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
		return "Review [reviewNo=" + reviewNo + ", category=" + category
				+ ", title=" + title + ", regDate=" + regDate + ", hits="
				+ hits + ", content=" + content + ", recommend=" + recommend
				+ ", report=" + report + ", memberId=" + memberId
				+ ", nickname=" + nickname + ", replyCount=" + replyCount
				+ ", pageNo=" + pageNo + ", sortType=" + sortType
				+ ", searchType=" + searchType + ", query=" + query + "]";
	}

	
}
