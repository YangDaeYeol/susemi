package com.jiping.tutor.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Certificate {
	private String email;
	private String certificateText;
	private String certificateImg;
}
