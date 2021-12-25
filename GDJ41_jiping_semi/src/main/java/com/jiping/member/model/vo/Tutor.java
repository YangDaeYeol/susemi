package com.jiping.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Tutor {

	private String nickname;
	private String phone;
	private String insta;
	private String facebook;
	private String blog;
	private String tutorMsg;
	
}
