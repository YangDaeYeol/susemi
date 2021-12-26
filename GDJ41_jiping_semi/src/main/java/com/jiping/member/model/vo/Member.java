package com.jiping.member.model.vo;

import java.sql.Array;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String email;
	private String memberGrade;
	private String password;
	private String memberName;
	private char gender;
	private String phone;
	private char marketing;
	private String profileImg;
	private String nickname;
	private String memberLocation;
	private String memberCategory;
}
