package com.ks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ks.dto.Food;
import com.ks.repository.FoodMapper;

@Service
public class MenuService {

	@Autowired
	private FoodMapper foodMapper;

	public List<Food> getAllMenus(int id) {
		return foodMapper.selectFoodList(id);
	}

	@Transactional
	public void addMenu(Food food) {
		foodMapper.insertMenu(food);
	}

	@Transactional
	public void updateMenu(Food food) {
		foodMapper.updateMenu(food);
	}

	@Transactional
	public void deleteMenu(int num) {
		foodMapper.deleteMenu(num);
	}
	
	public int selectCount() {
		return foodMapper.selectCount();
	}
	public Food selectMenutById(int num) {
		return foodMapper.selectMenutById(num);
	}

}
