package com.jiping.lecture.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureSchedule {

	private int scheduleNo;
	private int lectureNo;
	private int lecturePrice;
	private int lecturePersons;
	private String lectureLocation;
	private String lectureAddress;
	private Date lectureDate;
	private String startDate;
	private String endDate;
	
	
}
