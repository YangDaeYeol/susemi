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
public class VodLecture {
	
	private int lectureNo;
	private String vodUrl;
	private int vodPrice;
	private String vodTitle;
	private String vodContent;

}
