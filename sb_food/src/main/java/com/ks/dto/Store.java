package com.ks.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Builder
@ToString
public class Store {
	private int id;
	@NonNull private String storename;
	@NonNull private String business;
	@NonNull private String tel;
	@NonNull private String address;
	@NonNull private int grade;
	@NonNull private String thema;
	@NonNull private Double latitude;
	@NonNull private Double longitude;
}
