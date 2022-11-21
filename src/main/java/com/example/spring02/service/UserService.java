package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserCreateDto;
import com.example.spring02.dto.UserSearchDto;
import com.example.spring02.dto.UserSignDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {

	private final UserMapper userMapper;
	
	public List<User> read() {
		log.info("");
		return userMapper.selectOrderByIdDesc();
	}
	public User read(Integer id) {
		log.info("readById = {} ", id);
		return userMapper.selectById(id);
	}
	public int insert(UserCreateDto dto) {
		log.info("insert={}", dto);
		return userMapper.insert(dto.toEntity());
	}
	
	public int update(UserUpdateDto dto) {
		log.info("update = {}",dto);
		return userMapper.updateTitleAndContentById(dto.toEntity());
	}
	public int delete(Integer id) {
		
		log.info("delete = {}", id);
		
		return userMapper.deleteById(id);
	}
	
	public List<User> search(UserSearchDto dto) {
		log.info("searchByKeyword(dto={})",dto);
		
		dto.setKeyword("%" +dto.getKeyword().toLowerCase()+ "%");
		
		return userMapper.selectByKeywordOrderByIdDesc(dto);
		
	}
	
	public User login(UserSignDto dto) {
		log.info("select(User={}",dto);
	return userMapper.selectByUserNameAndPassword(dto.toEntity());
	}
}
