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
public class Comments {
	private int num;
	@NonNull String nickname;
	@NonNull String comment;
	@NonNull int id;
	@NonNull String curTime;
	@NonNull private Double grade;

}
