package com.jiping.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {
	private int commentNo;
	private String reportUser;
	private String reportType;
	private String reportContent;
	private Date reportDate;
	
}
