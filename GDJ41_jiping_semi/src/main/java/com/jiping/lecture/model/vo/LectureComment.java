package com.jiping.lecture.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureComment {

	private int commentNo;
	private int lectureNo;
	private String writer;
	private String starRate;
	private String commentContent;
	private Date enrollDate;
	private int commentLevel;
	private int commentRef;
	private String profileImg;
}
