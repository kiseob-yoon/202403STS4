package com.ks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ks.dto.Store;


@Mapper
public interface StoreMapper {
	
	int selectCount();
	List<Store> selectStoreList();
	void insertStore(Store store);
	void updateStore(Store store);
	void deleteStore(int id);
	Store selectStoretById(int id);
}
