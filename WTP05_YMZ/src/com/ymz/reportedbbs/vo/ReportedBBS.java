package com.ymz.reportedbbs.vo;

import java.io.Serializable;

public class ReportedBBS implements Serializable{

	private int reportNo;
	private String category;
	private int reviewNo;
	private String state;
	private String reason;
	private String reportedDate;
	private String reporterId;
	private int pageNo;				// 페이지 번호
	
	public ReportedBBS() {
		super();
	}

	public ReportedBBS(int reportNo, String category, int reviewNo,
			String state, String reason, String reportedDate,
			String reporterId, int pageNo) {
		super();
		this.reportNo = reportNo;
		this.category = category;
		this.reviewNo = reviewNo;
		this.state = state;
		this.reason = reason;
		this.reportedDate = reportedDate;
		this.reporterId = reporterId;
		this.pageNo = pageNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReportedDate() {
		return reportedDate;
	}

	public void setReportedDate(String reportedDate) {
		this.reportedDate = reportedDate;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + pageNo;
		result = prime * result + ((reason == null) ? 0 : reason.hashCode());
		result = prime * result + reportNo;
		result = prime * result
				+ ((reportedDate == null) ? 0 : reportedDate.hashCode());
		result = prime * result
				+ ((reporterId == null) ? 0 : reporterId.hashCode());
		result = prime * result + reviewNo;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
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
		ReportedBBS other = (ReportedBBS) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (pageNo != other.pageNo)
			return false;
		if (reason == null) {
			if (other.reason != null)
				return false;
		} else if (!reason.equals(other.reason))
			return false;
		if (reportNo != other.reportNo)
			return false;
		if (reportedDate == null) {
			if (other.reportedDate != null)
				return false;
		} else if (!reportedDate.equals(other.reportedDate))
			return false;
		if (reporterId == null) {
			if (other.reporterId != null)
				return false;
		} else if (!reporterId.equals(other.reporterId))
			return false;
		if (reviewNo != other.reviewNo)
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReportedBBS [reportNo=" + reportNo + ", category=" + category
				+ ", reviewNo=" + reviewNo + ", state=" + state + ", reason="
				+ reason + ", reportedDate=" + reportedDate + ", reporterId="
				+ reporterId + ", pageNo=" + pageNo + "]";
	}
	
	
	
}
