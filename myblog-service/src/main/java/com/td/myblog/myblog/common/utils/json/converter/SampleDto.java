package com.td.myblog.myblog.common.utils.json.converter;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import java.util.Date;
import java.util.List;

public class SampleDto {

	private Date d1;

	@JsonSerialize(converter = ToString.class) // java to json
	@JsonDeserialize(converter = ToLong.class) // json to java
	private Long	l1;
	private Long	l2;

	@JsonSerialize(converter = ToLong.class) // java to json
	@JsonDeserialize(converter = ToString.class) // json to java
	private String	s1;
	private String	s2;

	@JsonSerialize(converter = ToStringList.class) // java to json
	@JsonDeserialize(converter = ToLongList.class) // json to java
	private List<Long>	al1;
	private List<Long>	al2;

	@JsonSerialize(converter = ToLongList.class) // java to json
	@JsonDeserialize(converter = ToStringList.class) // json to java
	private List<String>	as1;
	private List<String>	as2;

	public List<String> getAs2() {
		return as2;
	}

	public void setAs2(List<String> as2) {
		this.as2 = as2;
	}

	public List<Long> getAl2() {
		return al2;
	}

	public void setAl2(List<Long> al2) {
		this.al2 = al2;
	}

	public Date getD1() {
		return d1;
	}

	public void setD1(Date d1) {
		this.d1 = d1;
	}

	public Long getL1() {
		return l1;
	}

	public void setL1(Long l1) {
		this.l1 = l1;
	}

	public String getS1() {
		return s1;
	}

	public void setS1(String s1) {
		this.s1 = s1;
	}

	public String getS2() {
		return s2;
	}

	public void setS2(String s2) {
		this.s2 = s2;
	}

	public Long getL2() {
		return l2;
	}

	public void setL2(Long l2) {
		this.l2 = l2;
	}

	public List<String> getAs1() {
		return as1;
	}

	public void setAs1(List<String> as1) {
		this.as1 = as1;
	}

	public List<Long> getAl1() {
		return al1;
	}

	public void setAl1(List<Long> al1) {
		this.al1 = al1;
	}

}
