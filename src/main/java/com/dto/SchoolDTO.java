package com.dto;

public class SchoolDTO {
	private String code;
	private String district;
	private String name;

	public SchoolDTO() {
	}

	public SchoolDTO(String code, String district, String name) {
		super();
		this.code = code;
		this.district = district;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}