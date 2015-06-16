package com.ymz.restaurant.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Restaurant implements Serializable {
	private int restaurantNo;
	private String restaurantName;
	private String category;
	private String phoneNo;
	private String description;
	private String pictureName;
	private float score;
	private int hits;
	private String theme;
	private String regDate;
	private int replyCount;
	private int locationNo;
	private String memberId;
	
	
	public Restaurant() {}


	public Restaurant(int restaurantNo, String restaurantName, String category,
			String phoneNo, String description, String pictureName,
			float score, int hits, String theme, String regDate,
			int replyCount, int locationNo, String memberId) {
		super();
		this.restaurantNo = restaurantNo;
		this.restaurantName = restaurantName;
		this.category = category;
		this.phoneNo = phoneNo;
		this.description = description;
		this.pictureName = pictureName;
		this.score = score;
		this.hits = hits;
		this.theme = theme;
		this.regDate = regDate;
		this.replyCount = replyCount;
		this.locationNo = locationNo;
		this.memberId = memberId;
	}


	public int getRestaurantNo() {
		return restaurantNo;
	}


	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}


	public String getRestaurantName() {
		return restaurantName;
	}


	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPictureName() {
		return pictureName;
	}


	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}


	public float getScore() {
		return score;
	}


	public void setScore(float score) {
		this.score = score;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}


	public String getTheme() {
		return theme;
	}


	public void setTheme(String theme) {
		this.theme = theme;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public int getLocationNo() {
		return locationNo;
	}


	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Restaurant [restaurantNo=" + restaurantNo + ", restaurantName="
				+ restaurantName + ", category=" + category + ", phoneNo="
				+ phoneNo + ", description=" + description + ", pictureName="
				+ pictureName + ", score=" + score + ", hits=" + hits
				+ ", theme=" + theme + ", regDate=" + regDate + ", replyCount="
				+ replyCount + ", locationNo=" + locationNo + ", memberId="
				+ memberId + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result + hits;
		result = prime * result + locationNo;
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((phoneNo == null) ? 0 : phoneNo.hashCode());
		result = prime * result
				+ ((pictureName == null) ? 0 : pictureName.hashCode());
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + replyCount;
		result = prime * result
				+ ((restaurantName == null) ? 0 : restaurantName.hashCode());
		result = prime * result + restaurantNo;
		result = prime * result + Float.floatToIntBits(score);
		result = prime * result + ((theme == null) ? 0 : theme.hashCode());
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
		Restaurant other = (Restaurant) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (hits != other.hits)
			return false;
		if (locationNo != other.locationNo)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (phoneNo == null) {
			if (other.phoneNo != null)
				return false;
		} else if (!phoneNo.equals(other.phoneNo))
			return false;
		if (pictureName == null) {
			if (other.pictureName != null)
				return false;
		} else if (!pictureName.equals(other.pictureName))
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (replyCount != other.replyCount)
			return false;
		if (restaurantName == null) {
			if (other.restaurantName != null)
				return false;
		} else if (!restaurantName.equals(other.restaurantName))
			return false;
		if (restaurantNo != other.restaurantNo)
			return false;
		if (Float.floatToIntBits(score) != Float.floatToIntBits(other.score))
			return false;
		if (theme == null) {
			if (other.theme != null)
				return false;
		} else if (!theme.equals(other.theme))
			return false;
		return true;
	}
	
}