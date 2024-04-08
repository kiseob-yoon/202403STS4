package com.ks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ks.dto.Store;
import com.ks.repository.StoreMapper;

@Service
public class StoreService {
	
	@Autowired
	private StoreMapper storeMapper;
	
	
	public int selectCount() {
		return storeMapper.selectCount();
	}
	
	public List<Store> selectStoreList(){
		return storeMapper.selectStoreList();
	}
	public List<Store> selectRank(){
		return storeMapper.selectRank();
	}
	
	public void insertStore(Store store) {
		storeMapper.insertStore(store);
	}
	
	public void updateStore(Store store) {
		storeMapper.updateStore(store);
	}
	
	public void deleteStore(int id) {
		storeMapper.deleteStore(id);
	}
	
	public Store selectStoretById(int id) {
		return storeMapper.selectStoretById(id);
	}
	
	public void updateHits(int id) {
		storeMapper.updateHits(id);
	}
	
	@Transactional
    public String likePost(int memberId, int storeId) {
        int count = storeMapper.checkLikeExists(memberId, storeId);
        if (count > 0) {
            return "이미 좋아요를 누르셨습니다.";
        } else {
        	storeMapper.addLike(memberId, storeId);
        	storeMapper.incrementLikeCount(storeId);
            return "좋아요가 성공적으로 추가되었습니다.";
        }
        
    }
	
	
	
	
	
	
	
}
