package model;

public class RegStdDataBean {
	
	private int stdRegId;
	private String stdName;
	private String cnic;
	private String logId;
	private String password;
	
	
	public RegStdDataBean() {
		
	}
	
	public RegStdDataBean(int std_reg_id, String std_name, String cnic, String log_id, String password) {
		this.stdRegId = std_reg_id;
		this.stdName = std_name;
		this.cnic = cnic;
		this.logId = log_id;
		this.password = password;
	}
	
	public int getStd_reg_id() {
		return stdRegId;
	}
	public void setStd_reg_id(int std_reg_id) {
		this.stdRegId = std_reg_id;
	}
	public String getStd_name() {
		return stdName;
	}
	public void setStd_name(String std_name) {
		this.stdName = std_name;
	}
	public String getCnic() {
		return cnic;
	}
	public void setCnic(String cnic) {
		this.cnic = cnic;
	}
	public String getLog_id() {
		return logId;
	}
	public void setLog_id(String log_id) {
		this.logId = log_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
