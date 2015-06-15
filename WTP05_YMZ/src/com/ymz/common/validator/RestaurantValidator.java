package com.ymz.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ymz.restaurant.vo.Restaurant;

public class RestaurantValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Restaurant.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "restaurantName", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNo", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "theme", "required");
	}
}
