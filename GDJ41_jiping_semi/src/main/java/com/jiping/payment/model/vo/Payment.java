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
	private String payment_No;
	private int lecture_No;
	private String email;
	private String payment_Type;
	private int payment_price;
}
