package com.example.spring02.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@ToString
public class User {
	
	
	private Integer id;
	private String username;
	private String password;
	private String email;
	private Integer points;
	
	
}
