package com.example.spring02.dto;
// 포스트 작성 페이지에서 보낸 요청 파라미너들을 저장하고 서비스 계층으로 전달하기 위한 목적.

import com.example.spring02.domain.User;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data //@RequiredArgsConstructor + @Getter + @Setter + @ToString + @EqualsAndHashCode
public class UserCreateDto {

	private String username;
	private String password;
	private String email;
	
	//DTO 객체를 Entity 객체로 변환해서 리턴하는 메서드.
	public User toEntity() {
		
		return User.builder().username(username).password(password)
				.email(email).build();
	}
	
}
