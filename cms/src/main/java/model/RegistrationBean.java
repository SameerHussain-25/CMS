package model;

public class RegistrationBean {
	
	 	private int stdRegid;
	    private int stdId;
	    private String cnic;
	    private String password;
	    

	    public RegistrationBean() {
	    }

	    public RegistrationBean(int stdId, String cnic, String password) {
	        this.stdId = stdId;
	        this.cnic = cnic;
	        this.password = password;
	    }

	    public int getstdRegid() {
	        return stdRegid;
	    }

	    public void setstdRegid(int stdRegid) {
	        this.stdRegid = stdRegid;
	    }

	    public int getstdId() {
	        return stdId;
	    }

	    public void setstdId(int stdId) {
	        this.stdId = stdId;
	    }

	    public String getCnic() {
	        return cnic;
	    }

	    public void setCnic(String cnic) {
	        this.cnic = cnic;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }


	    

}
