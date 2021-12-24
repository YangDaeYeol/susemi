package com.jiping.lecture.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Lecture {
	
	private int lectureNo;
	private String nickName;
	private String lectureType;
	private String lectureCategory;
	private String lectureTitle;
	private int wishCount;
	private int commentCount;
	private char confirm;

}
