package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.dto.PostSearchDto;
import com.example.spring02.dto.PostUpdateDto;
import com.example.spring02.mapper.PostMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final필드를 아규먼트로 갖는 생성자를 만들어줌.
@Service
// -> @Service + applicationContext.xml : 스프링 컨테이너에 서비스 컴포넌트로 등록.
// -> 스프링 컨테이너에 서비스컴포넌트로 등록. -> 필요한 곳에 service 컴포넌트를 주입할 수 있음.
public class PostService {
	
	
	//의존성 주입: 
	// (1) 필드에 의한 의존성 주입: @Autowired
	// (2) 생산자에 의한 의존성 주입. : final필드 + Required-Args 생성자.
	
	// @Autowired private PostMapper postMapper;
	
	private final PostMapper postMapper;

	public List<Post> read() {
		log.info("");
		return postMapper.selectOrderByIdDesc();
	}
	
	public Post read(Integer id) {
		log.info("readById = {}", id);
		return postMapper.selectById(id);
	}
	
	
	public int insert(PostCreateDto dto) {
		log.info("insert = {}", dto);
	return postMapper.insert(dto.toEntity());	
	}
	
	public int update(PostUpdateDto dto) {
		log.info("update = {}", dto);
	return postMapper.updateTitleAndContentById(dto.toEntity());
	}

	public int delete(Integer id) {
		
		log.info("delete = {}", id);
		
		return postMapper.deleteById(id);
	}
	
	public List<Post> search(PostSearchDto dto) {
		log.info("searchByKeyword(dto={})",dto);
		
		dto.setKeyword("%" +dto.getKeyword().toLowerCase()+ "%");
		
		return postMapper.selectByKeywordOrderByIdDesc(dto);
	}
}
