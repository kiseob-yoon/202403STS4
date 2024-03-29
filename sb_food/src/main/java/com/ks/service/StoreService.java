package com.ks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
