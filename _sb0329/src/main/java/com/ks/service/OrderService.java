package com.ks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ks.model.Orders;
import com.ks.repository.OrderMapper;

@Service
public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	public List<Orders> getAllOrders() {
        return orderMapper.selectAllOrders();
    }

}
