package com.ks.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@RequiredArgsConstructor //NonNull붙은 것만 생성자를 만듬
@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
public class Member {
	private Long memberId;
	@NonNull private String name;
	@NonNull private String city;
	@NonNull private String street;
	@NonNull private int zipcode;
	
}
