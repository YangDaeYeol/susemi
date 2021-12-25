package com.jiping.tutor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Tutor {
	
	private String email;
	private String insta;
	private String facebook;
	private String blog;
	private String tutorMsg;
	
}
