package com.keduox.util.vo;

import com.keduox.util.HibernateTypeEnum;

public class QueryParamsMapVo {

	private String field;
	
	private Object value;
	
	private HibernateTypeEnum type;

	public QueryParamsMapVo(String field, Object value, HibernateTypeEnum type) {
		super();
		this.field = field;
		this.value = value;
		this.type=type;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public HibernateTypeEnum getType() {
		return type;
	}

	public void setType(HibernateTypeEnum type) {
		this.type = type;
	}

	

}
