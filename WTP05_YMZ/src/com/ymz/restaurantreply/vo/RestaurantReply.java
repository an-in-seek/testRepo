package com.ymz.restaurantreply.vo;

public class RestaurantReply {

	private int number;
	private String regDate;
	private String content;
	private int score;
	private String memberId;
	private int restaurantNo;
	private String nickname;
	public RestaurantReply() {
		super();
	}
	public RestaurantReply(int number, String regDate, String content,
			int score, String memberId, int restaurantNo, String nickname) {
		super();
		this.number = number;
		this.regDate = regDate;
		this.content = content;
		this.score = score;
		this.memberId = memberId;
		this.restaurantNo = restaurantNo;
		this.nickname = nickname;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
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
		result = prime * result + number;
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + restaurantNo;
		result = prime * result + score;
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
		RestaurantReply other = (RestaurantReply) obj;
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
		if (number != other.number)
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (restaurantNo != other.restaurantNo)
			return false;
		if (score != other.score)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "RestaurantReply [number=" + number + ", regDate=" + regDate
				+ ", content=" + content + ", score=" + score + ", memberId="
				+ memberId + ", restaurantNo=" + restaurantNo + ", nickname="
				+ nickname + "]";
	}
	
	
	
	
	
	
}
