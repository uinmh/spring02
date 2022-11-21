package com.example.spring02.mapper;

import java.util.List;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserSearchDto;

public interface UserMapper {

	List<User> selectOrderByIdDesc();
	int insert(User entity);
	User selectById(Integer id);
	int updateTitleAndContentById(User entity);
	int deleteById(Integer id);
	List<User> selectByKeywordOrderByIdDesc(UserSearchDto searchArgs);
	User selectByUserNameAndPassword(User entity);
}
