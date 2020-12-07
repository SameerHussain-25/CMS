package model;

public class ComplainCatBean {

	private int complainCatId;
	private String category;
	private String remarks;
	
	
	
	public ComplainCatBean() {

	}
	
	public ComplainCatBean(int complainCatId, String category, String remarks) {
		this.complainCatId = complainCatId;
		this.category = category;
		this.remarks = remarks;
	}
	
	public int getComplainCatId() {
		return complainCatId;
	}
	
	public void setComplainCatId(int complainCatId) {
		this.complainCatId = complainCatId;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getRemarks() {
		return remarks;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
