package com.jiping.lecture.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Lecture_Schedule {
	private int lecture_No;
	private int lecture_Price;
	private int lecture_Persons;
	private String lecture_Location;
	private String lecture_Address;
	private Date lecture_Date;
}
