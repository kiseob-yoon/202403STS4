package com.ks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ks.dto.Store;


@Mapper
public interface StoreMapper {
	
	int selectCount();
	List<Store> selectStoreList();
	List<Store> selectStorePointer();
	List<Store> selectRank();
	void insertStore(Store store);
	void updateStore(Store store);
	void updateHits(int id);
	void deleteStore(int id);
	Store selectStoretById(int id);
	
    int checkLikeExists(int memberId, int storeId);
    int addLike(int memberId, int storeId);
    int incrementLikeCount(int storeId);
    
    List<Store> selectStore(String storename);
}
