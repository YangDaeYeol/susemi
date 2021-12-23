package com.jiping.lecture.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureContent {

	private int lectureNo;
	private String lectureIntroduce;
	private String recommend;
	private String curriculum;
	private String lectureNotice;
}
