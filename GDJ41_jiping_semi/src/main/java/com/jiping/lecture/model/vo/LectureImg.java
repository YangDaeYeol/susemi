
package com.jiping.lecture.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureImg {
	
	private int lectureNo;
	private String lectureFileName;

}
