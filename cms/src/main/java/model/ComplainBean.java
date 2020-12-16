package model;

import java.sql.Timestamp;

public class ComplainBean {
	
	private int complainId;
	private int complainCatId;
	private int stdRegId;
	private String complain;
	private String location;
	private Timestamp datetime;
	private int status;
	private String remark;

	    public ComplainBean() {
	    }

	    public ComplainBean(int complainId, int complainCatId, int stdRegId, String complain, String location, Timestamp datetime, int status ,String remark) {
	        this.complainId = complainId;
	        this.complainCatId = complainCatId;
	        this.stdRegId = stdRegId;
	        this.complain = complain;
	        this.location = location;
	        this.datetime = datetime;
	        this.status = status;
	        this.remark = remark;
	    }

	    public int getcomplainId() {
	        return complainId;
	    }

	    public void setcomplainId(int complainId) {
	        this.complainId = complainId;
	    }

	    public int getcomplainCatId() {
	        return complainCatId;
	    }

	    public void setcomplainCatId(int complainCatId) {
	        this.complainCatId = complainCatId;
	    }

	    public int getstdRegId() {
	        return stdRegId;
	    }

	    public void setstdRegId(int stdRegId) {
	        this.stdRegId = stdRegId;
	    }

	    public String getComplain() {
	        return complain;
	    }

	    public void setComplain(String complain) {
	        this.complain = complain;
	    }

	    public String getLocation() {
	        return location;
	    }

	    public void setLocation(String location) {
	        this.location = location;
	    }

	    public Timestamp getDatetime() {
	        return datetime;
	    }

	    public void setDatetime(Timestamp datetime) {
	        this.datetime = datetime;
	    }
	    
	    public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}


	    public String getRemark() {
	        return remark;
	    }

	    public void setRemark(String remark) {
	        this.remark = remark;
	    }



}
