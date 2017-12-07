package com.keduox.util;

import org.springframework.stereotype.Component;

@Component
public class Message {
	//状态
	private int sta;
	//提示信息
	private String massage;
	public int getSta() {
		return sta;
	}
	public void setSta(int sta) {
		this.sta = sta;
	}
	public String getMassage() {
		return massage;
	}
	public void setMassage(String massage) {
		this.massage = massage;
	}

}
