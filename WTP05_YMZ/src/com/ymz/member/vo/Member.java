package com.ymz.member.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Member implements Serializable{
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String birth;
	private String sex;
	private String zipcode;
	private String address;
	private String detailAddress;
	private String email;
	private String phoneNo;
	private String favoriteFood;
	private int mileage;
	private String grade;
	private String joinDate;
	
	/*
	 * no-arg 생성자
	 */
	public Member(){}

	/*
	 * favoriteFood를 제외한 생성자 
	 */
	public Member(String id, String password, String name, String nickname,
			String birth, String sex, String zipcode, String address,
			String detailAddress, String email, String phoneNo, int mileage,
			String grade, String joinDate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.sex = sex;
		this.zipcode = zipcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
		this.phoneNo = phoneNo;
		this.mileage = mileage;
		this.grade = grade;
		this.joinDate = joinDate;
	}
	
	/*
	 * 생성자
	 */
	public Member(String id, String password, String name, String nickname,
			String birth, String sex, String zipcode, String address,
			String detailAddress, String email, String phoneNo,
			String favoriteFood, int mileage, String grade, String joinDate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.sex = sex;
		this.zipcode = zipcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
		this.phoneNo = phoneNo;
		this.favoriteFood = favoriteFood;
		this.mileage = mileage;
		this.grade = grade;
		this.joinDate = joinDate;
	}
	
	/*
	 * setter, getter, toString, hashCode
	 */

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getFavoriteFood() {
		return favoriteFood;
	}

	public void setFavoriteFood(String favoriteFood) {
		this.favoriteFood = favoriteFood;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name
				+ ", nickname=" + nickname + ", birth=" + birth + ", sex="
				+ sex + ", zipcode=" + zipcode + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", email=" + email
				+ ", phoneNo=" + phoneNo + ", favoriteFood=" + favoriteFood
				+ ", mileage=" + mileage + ", grade=" + grade + ", joinDate="
				+ joinDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result
				+ ((detailAddress == null) ? 0 : detailAddress.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((favoriteFood == null) ? 0 : favoriteFood.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((joinDate == null) ? 0 : joinDate.hashCode());
		result = prime * result + mileage;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phoneNo == null) ? 0 : phoneNo.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((zipcode == null) ? 0 : zipcode.hashCode());
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
		Member other = (Member) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (detailAddress == null) {
			if (other.detailAddress != null)
				return false;
		} else if (!detailAddress.equals(other.detailAddress))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (favoriteFood == null) {
			if (other.favoriteFood != null)
				return false;
		} else if (!favoriteFood.equals(other.favoriteFood))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (joinDate == null) {
			if (other.joinDate != null)
				return false;
		} else if (!joinDate.equals(other.joinDate))
			return false;
		if (mileage != other.mileage)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phoneNo == null) {
			if (other.phoneNo != null)
				return false;
		} else if (!phoneNo.equals(other.phoneNo))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (zipcode == null) {
			if (other.zipcode != null)
				return false;
		} else if (!zipcode.equals(other.zipcode))
			return false;
		return true;
	}
	
	

	
	
	
}