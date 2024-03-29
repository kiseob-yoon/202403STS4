package com.sky.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.sky.dto.State;

@Configuration
public class Config {
	
	@Bean
	public State state() {
		return new State();
	}
}
