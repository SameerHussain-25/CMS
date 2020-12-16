package model;

public class RegStdDataBean {
	
	private int stdRegId;
	private String stdName;
	private String cnic;
	private String logId;
	private String password;
	
	
	public RegStdDataBean() {}
	
	public RegStdDataBean(int stdRegId, String stdName, String cnic, String logId, String password) {
		this.stdRegId = stdRegId;
		this.stdName = stdName;
		this.cnic = cnic;
		this.logId = logId;
		this.password = password;
	}
	
	public int getStdRegId() {
		return stdRegId;
	}
	public void setStdRegId(int stdRegId) {
		this.stdRegId = stdRegId;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getCnic() {
		return cnic;
	}
	public void setCnic(String cnic) {
		this.cnic = cnic;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
