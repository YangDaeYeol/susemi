package com.jiping.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	private String paymentNo;
	private int lectureNo;
	private String email;
	private String paymentType;
	private int paymentPrice;
	private String merchantNo;
	private int scheduleNo;
}
