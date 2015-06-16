package com.ymz.faq.vo;

import java.io.Serializable;

public class FAQ implements Serializable{

	private int number;
	private int refamily;
	private int restep;
	private int relevel;
	private String title;
	private String content;
	private String memberId;
	
	public FAQ() { }

	public FAQ(int number, int refamily, int restep, int relevel, String title,
			String content, String memberId) {
		super();
		this.number = number;
		this.refamily = refamily;
		this.restep = restep;
		this.relevel = relevel;
		this.title = title;
		this.content = content;
		this.memberId = memberId;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getRefamily() {
		return refamily;
	}

	public void setRefamily(int refamily) {
		this.refamily = refamily;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "FAQ [number=" + number + ", refamily=" + refamily + ", restep="
				+ restep + ", relevel=" + relevel + ", title=" + title
				+ ", content=" + content + ", memberId=" + memberId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + number;
		result = prime * result + refamily;
		result = prime * result + relevel;
		result = prime * result + restep;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FAQ other = (FAQ) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (number != other.number)
			return false;
		if (refamily != other.refamily)
			return false;
		if (relevel != other.relevel)
			return false;
		if (restep != other.restep)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
}