package model;

public class AdminBean {

	private int adminId;
	private String adminName;
	private String adminPassword;
	private String remarks;
	
	
	
	public AdminBean() {
		
	}

	public AdminBean(int adminId, String adminName, String adminPassword, String remarks) {	
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPassword = adminPassword;
		this.remarks = remarks;
	}
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
