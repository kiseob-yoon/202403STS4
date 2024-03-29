package com.ks.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@RequiredArgsConstructor //final이 붙은 것만 생성자를 만든다.
@Getter
@Setter
@ToString
public class Product {
	private Long prodId;
	@NonNull private String prodName;
	@NonNull private int prodPrice;
}
