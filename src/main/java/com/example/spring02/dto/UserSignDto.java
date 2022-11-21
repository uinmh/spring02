package com.example.spring02.dto;

import com.example.spring02.domain.User;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserSignDto {

	private String username;
	private String password;
	
public User toEntity() {
		
		return User.builder().username(username).password(password)
				.build();
		
	}
	
}
