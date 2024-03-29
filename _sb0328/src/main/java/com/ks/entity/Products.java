package com.ks.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity //테이블을 생성
public class Products {
	
	@Id //primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) //auto_increment
	private Long prodId;
	private String prodName;
	private Integer prodPrice;
}
