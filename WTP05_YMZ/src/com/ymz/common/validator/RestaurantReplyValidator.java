package com.ymz.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ymz.restaurantreply.vo.RestaurantReply;

public class RestaurantReplyValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(RestaurantReply.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "score", "required");
		
	}

	
	
}
