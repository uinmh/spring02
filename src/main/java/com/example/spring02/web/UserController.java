package com.example.spring02.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.User;

import com.example.spring02.dto.UserCreateDto;
import com.example.spring02.dto.UserSearchDto;
import com.example.spring02.dto.UserSignDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;
	
	@GetMapping("/list")
	
	public String list(Model model) {
		
		List<User> list = userService.read();
		
		model.addAttribute("list", list);
		
		return "/users/userlist";
		
	}
	
	@GetMapping("/join")
	public String join() {
		
		log.info("join()");
		
		return "redirect:/post/list";
	}
	@PostMapping("/join")
	public String join(UserCreateDto dto) {
		
		log.info("join(dto={})",dto);
		
		userService.insert(dto);
		
		return "redirect:/";
	}
	
	@GetMapping("/detail")
	public String detail(Integer id, Model model) {
		
		log.info("detail()");
		log.info("id={}",id);
		
		User user = userService.read(id);
		
		model.addAttribute("user",user);
		
		return "/users/detail";
	}
	
	@GetMapping("/modify")
	public String modify(Integer id, Model model) {
		
		log.info("id = {}",id);
		
		User User = userService.read(id);
		
		model.addAttribute("user",User);
		
		return "/users/modify";
	}
	
	@PostMapping("/modify")
	public String update(UserUpdateDto dto) {
		
		userService.update(dto);
		
		log.info("userModify()");
		
		return "redirect:/users/detail?id=" + dto.getId();
	}
	
	@PostMapping("/delete")
	public String delete(Integer id) {
	
		log.info("id = {}",id);
		
		int result = userService.delete(id);
		
		log.info("delete Result = {}", result);
		
		return "redirect:/users/list";
	}
	
	@GetMapping("/search")
	public String search(UserSearchDto dto, Model model) {
		
		log.info("search(dto= {})",dto);
		
		// 검색 서비스 수행
		
		List<User> result = userService.search(dto);
		
		model.addAttribute("list", result);
		
		return "/users/userlist";
	}
	
	@PostMapping("/login")
	public String login(UserSignDto dto, HttpServletRequest request) {
	
		log.info("login()");
		
		User user = userService.login(dto);
		
		if (user == null) {
			log.info("로그인 실패");
			return "redirect:/";
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("signInUser", user.getUsername());
		
		return "redirect:/post/list";
	}
}
