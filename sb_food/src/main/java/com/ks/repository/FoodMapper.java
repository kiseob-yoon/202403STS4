package com.ks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ks.dto.Food;


@Mapper
public interface FoodMapper {
	
	int selectCount();
	List<Food> selectFoodList(int id);
	void insertMenu(Food food);
	void updateMenu(Food food);
	void deleteMenu(int num);
	Food selectMenutById(int num);
	

}
