package com.ks.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Member {
	
	@Id //primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) //auto_increment
	private Long memberId;
	private String name;
	private String city;
	private String street;
	private int zipcode;
}
