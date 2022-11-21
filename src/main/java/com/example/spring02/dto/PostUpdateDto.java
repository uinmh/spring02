package com.example.spring02.dto;

import com.example.spring02.domain.Post;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PostUpdateDto {

	private String title;
	private String content;
	private Integer id;
	
public Post toEntity() {
		
		return Post.builder().title(title).content(content).id(id)
				.build();
		
	}
	
}
