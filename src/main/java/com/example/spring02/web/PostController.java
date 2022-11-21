package com.example.spring02.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.dto.PostSearchDto;
import com.example.spring02.dto.PostUpdateDto;
import com.example.spring02.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 스프링 컨테이너가 빈으로 생성하고 관리.
@RequestMapping("/post")
//-> 클래스에 @RequestMapping 애너테이션을 사용하면,
//-> 그 클래스의 모든 메서드들의 메핑주소는 @requestMapping에서 설정된 url로 시작함.
@RequiredArgsConstructor
public class PostController {

	private final PostService postService; // 생성자에 의한 의존성 주입.
	
	//TODO: 목록 / 새글작성 / 상세보기 / 수정,삭제 페이지 보기/ 컨트롤러 메서드
	
	
	@GetMapping("/list")
	
	public String list(Model model) {

	log.info("list()");

	List<Post> list = postService.read();
	
	model.addAttribute("post",list);
	
		return "/post/list";
	}

//	//포워드
//	@GetMapping("/post")
//	public String post() {
//		
//		return "forward:/post/list";
//	}
	
	
	@GetMapping("/insert")
	public String insert() {
		
		log.info("insert()");
		
		return "/post/insert";
	}
	
//	@PostMapping("/insert")
//	public String insert(HttpServletRequest request) {
//		
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		String author = request.getParameter("author");
//		
//		Post post = Post.builder().title(title).content(content).author(author)
//				.build();
//		
//		postService.insert(post);
//		
//		log.info("insert()");
//		
//	return "redirect:/post/list";
//
//	}
	
	@PostMapping("/insert")
	public String insert(PostCreateDto dto) {
		
		log.info("insert(dto={})",dto);
		
		postService.insert(dto);
		
	return "redirect:/post/list";

	}
	
	
	//상세보기
	@GetMapping("/detail")
	public String detail(Integer id, Model model) {
		
		log.info("detail()");
		
		log.info("id ={}",id);
		
		Post post = postService.read(id);

		model.addAttribute("post",post);
		
		return "/post/detail";
	}
	
	@GetMapping("/modify")
	public String modify(Integer id, Model model) {
	
		log.info("id = {}", id);

		Post post = postService.read(id);
		
		log.info("post={}", post);
		
		model.addAttribute("post",post);
		
			return "/post/modify";
	}
	
	@PostMapping("/modify")
	public String update(PostUpdateDto dto) {
		
		postService.update(dto);
		
		log.info("postModify()");
		
		return "redirect:/post/detail?id=" + dto.getId();
				//redirect:/post/list";
	}
	
	@PostMapping("/delete")
	public String delete(Integer id) {
	
		log.info("id = {}",id);
		
		int result = postService.delete(id);
		
		log.info("delete Result = {}", result);
		
		return "redirect:/post/list";
	}
	
	@GetMapping("/test")
	public String test(Model model) {
		
		log.info("test()");

		List<Post> list = postService.read();
		
		model.addAttribute("list",list);
		
		return "/post/test";
	}
	
	@GetMapping("/search")
	public String search(PostSearchDto dto, Model model) {
		
		log.info("search(dto= {})",dto);
		
		// 검색 서비스 수행
		
		List<Post> result = postService.search(dto);
		
		model.addAttribute("post", result);
		
		return "/post/list";
	}
}
