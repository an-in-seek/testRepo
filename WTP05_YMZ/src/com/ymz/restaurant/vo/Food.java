package com.ymz.restaurant.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Food implements Serializable {
	private int foodNo;
	private String foodName;
	private int foodPrice;
	private String foodDescription;
	private int restaurantNo;
	
	public Food() {}
	public Food(int foodNo, String foodName, int foodPrice,
			String foodDescription, int restaurantNo) {
		this.foodNo = foodNo;
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.foodDescription = foodDescription;
		this.restaurantNo = restaurantNo;
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodDescription() {
		return foodDescription;
	}

	public void setFoodDescription(String foodDescription) {
		this.foodDescription = foodDescription;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((foodDescription == null) ? 0 : foodDescription.hashCode());
		result = prime * result
				+ ((foodName == null) ? 0 : foodName.hashCode());
		result = prime * result + foodNo;
		result = prime * result + foodPrice;
		result = prime * result + restaurantNo;
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
		Food other = (Food) obj;
		if (foodDescription == null) {
			if (other.foodDescription != null)
				return false;
		} else if (!foodDescription.equals(other.foodDescription))
			return false;
		if (foodName == null) {
			if (other.foodName != null)
				return false;
		} else if (!foodName.equals(other.foodName))
			return false;
		if (foodNo != other.foodNo)
			return false;
		if (foodPrice != other.foodPrice)
			return false;
		if (restaurantNo != other.restaurantNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Food [foodNo=" + foodNo + ", foodName=" + foodName
				+ ", foodPrice=" + foodPrice + ", foodDescription="
				+ foodDescription + ", restaurantNo=" + restaurantNo + "]";
	}
	
}
