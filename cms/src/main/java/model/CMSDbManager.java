package model;

import java.sql.DriverManager;
import java.sql.Timestamp;
import java.util.ArrayList;

public class CMSDbManager {
	

	
	static java.sql.Connection con;
	
	/****************************************************** Connection Block *********************************************************/		
	static{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    String path="jdbc:mysql://localhost:3306/cmss?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(path, "root", "");
			System.out.println("Connection Established!!!");
		}catch(java.sql.SQLException sqle){
			sqle.printStackTrace();
			javax.swing.JOptionPane.showMessageDialog(null,"Connection Not Established due to "+sqle.getMessage()+"");
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
			javax.swing.JOptionPane.showMessageDialog(null,"Connection Not Established due to "+cnfe.getMessage()+"");
		}	
	}//End of conneciton static block	
    


	  ///////********Registration TABLE ********///////
    ///////******** INSERT Student info in In Registration
    public static void registerdStudent(model.RegistrationBean bean)throws Exception{    
        String query = "insert into registration (std_id,cnic,password,datetime) values(?,?,?,?)";
        System.out.println("Query : "+query);
        java.sql.PreparedStatement ps = null;
        java.sql.ResultSet rs = null;
        Integer id = 0;

        try{
            ps = con.prepareStatement(query);
            ps.setInt(1, bean.getstdId());
            ps.setString(2, bean.getCnic());
            ps.setString(3, bean.getPassword());
            ps.setTimestamp(4,new java.sql.Timestamp(System.currentTimeMillis()));

            ps.executeUpdate();
        }finally{
            if(ps != null) ps.close();
            if(rs != null) rs.close();
        } 
       
    }
    
	
    ///////********Students TABLE ********///////
    ///////******** Get student data by roll_num  
  public static StudentBean getStudentByStdRollNum(String stdRollNum)throws Exception{
  String query =  "SELECT * FROM student WHERE roll_num=?";
  System.out.println("Query : "+query);
  java.sql.PreparedStatement ps = null;
  java.sql.ResultSet rs = null;
  StudentBean bean=null;
  try{
      ps = con.prepareStatement(query);
      ps.setString(1,stdRollNum);
      rs = ps.executeQuery();
      if(rs != null){
    	  bean = new StudentBean();
          while(rs.next()){
          	  bean.setstdId(rs.getInt("std_id"));
              bean.setName(rs.getString("std_name"));
              bean.setfatherName(rs.getString("father_name"));
              bean.setSurname(rs.getString("surname"));
              bean.setReligion(rs.getString("religion"));
              bean.setCountry(rs.getString("country"));
              bean.setGender(rs.getString("gender"));
              bean.setrollNum(rs.getString("roll_num"));
              bean.setDepartment(rs.getString("department"));
              bean.setProgram(rs.getString("program"));
              bean.setBatch(rs.getString("batch"));
            }
      }
      return bean;
  }finally{
      if(ps != null) ps.close();
      if(rs != null) rs.close();
  }
  
}



    ///////********Students TABLE ********///////
    ///////******** cheking std admisiion by roll_num 
	  public static boolean checkStdAdmissionByRollNum(String stdRollNum)throws Exception{
		  String query =  "SELECT * FROM student WHERE roll_num=?";
		  System.out.println("Query : "+query);
		  java.sql.PreparedStatement ps = null;
		  java.sql.ResultSet rs = null;
	
		  boolean check=false;
		  try{
		      ps = con.prepareStatement(query);
		      ps.setString(1,stdRollNum);
		      rs = ps.executeQuery();
		      if(rs != null){
		          while(rs.next()){
		        	  check=true;
		          }
		          }
		  }finally{
		      if(ps != null) ps.close();
		      if(rs != null) rs.close();
		  }
		  return check;
	}
	  
    ///////********Registration TABLE ********///////
    ///////******** cheking if std already registerd  by roll_num 
	  public static boolean checkIfStdRegisterdByRollNum(String stdRollNum)throws Exception{
		  String query ="SELECT  * FROM student,registration WHERE student.std_id=registration.`std_id` AND student.`roll_num`=?";
		  System.out.println("Query : "+query);
		  java.sql.PreparedStatement ps = null;
		  java.sql.ResultSet rs = null;
	
		  boolean check=false;
		  try{
		      ps = con.prepareStatement(query);
		      ps.setString(1,stdRollNum);
		      rs = ps.executeQuery();
		      if(rs != null){
		          while(rs.next()){
		        	  check=true;
		          }
		          }
		  }finally{
		      if(ps != null) ps.close();
		      if(rs != null) rs.close();
		  }
		  return check;
	}
	  

    ///////********Admin Table ********///////
    ///////******** cheking admin by user name and password
	  public static boolean checkAdminUnamePassword(String name,String password)throws Exception{
		  String query =  "SELECT * FROM admin WHERE NAME=? AND PASSWORD=?";
		  System.out.println("Query : "+query);
		  java.sql.PreparedStatement ps = null;
		  java.sql.ResultSet rs = null;
	
		  boolean check=false;
		  try{
		      ps = con.prepareStatement(query);
		      ps.setString(1,name);
		      ps.setString(2,password);
		      rs = ps.executeQuery();
		      if(rs != null){
		          while(rs.next()){
		        	  check=true;
		          }
		          }
		  }finally{
		      if(ps != null) ps.close();
		      if(rs != null) rs.close();
		  }
		  return check;
	}  
	  
	    ///////********registration Table ********///////
	    ///////******** cheking student by user name and password
		  public static boolean checkStudentUnamePassword(String rollnum,String password)throws Exception{
			  String query =  "SELECT * FROM registration,student WHERE registration.`std_id`=student.`std_id` AND student.`roll_num`=? AND registration.`password`=?";
			  System.out.println("Query : "+query);
			  java.sql.PreparedStatement ps = null;
			  java.sql.ResultSet rs = null;
		
			  boolean check=false;
			  try{
			      ps = con.prepareStatement(query);
			      ps.setString(1,rollnum);
			      ps.setString(2,password);
			      rs = ps.executeQuery();
			      if(rs != null){
			          while(rs.next()){
			        	  check=true;
			          }
			          }
			  }finally{
			      if(ps != null) ps.close();
			      if(rs != null) rs.close();
			  }
			  return check;
		}   
	 	  
		  ///////********Students TABLE ********///////
		    ///////******** Get student data by roll_num  
		  public static ArrayList<ComplainBean> getComplains(int stdRegId)throws Exception{
		  String query =  "SELECT * FROM complain where std_reg_id="+stdRegId;
		  System.out.println("Query : "+query);
		  java.sql.PreparedStatement ps = null;
		  java.sql.ResultSet rs = null;
		  ArrayList<ComplainBean> list = null;
		  
		  try{
		      ps = con.prepareStatement(query);
		      rs = ps.executeQuery();
		      if(rs != null){
		          while(rs.next()){
		        	  
		        	  if(list == null)
		        		  list = new ArrayList<ComplainBean>();
		        	  
		        	  ComplainBean bean = new ComplainBean();
		        	  
		        	  bean.setcomplainId(rs.getInt("complain_id"));
		        	  bean.setcomplainCatId(rs.getInt("complain_cat_id"));
		        	  bean.setstdRegId(rs.getInt("std_reg_id"));
		        	  bean.setComplain(rs.getString("complain"));
		        	  bean.setLocation(rs.getString("location"));
		        	  java.util.Date date = rs.getDate("datetime");
		        	  Timestamp ts=new Timestamp(date.getTime());
		        	  bean.setDatetime(ts);
		        	  bean.setRemark(rs.getString("remarks"));
		        	  
		        	  list.add(bean);
		         }
		      }
		      return list;
		  }finally{
		      if(ps != null) ps.close();
		      if(rs != null) rs.close();
		  }
		  
		}
		  
		  ///////********Students TABLE ********///////
		    ///////******** Get student data by roll_num  
		  public static int getStdRegId(int stdId)throws Exception{
		  String query =  "SELECT registration.std_reg_id FROM student JOIN registration ON student.std_id = registration.std_id WHERE student.std_id ="+stdId;
		  System.out.println("Query : "+query);
		  java.sql.PreparedStatement ps = null;
		  java.sql.ResultSet rs = null;
		  
		  try{
		      ps = con.prepareStatement(query);
		      rs = ps.executeQuery();
		      int stdRegId = 0;
		      if(rs != null){
		          while(rs.next()){
		        	  
		        	  stdRegId = rs.getInt("std_reg_id");
		         }
		      }
		      return stdRegId;
		  }finally{
		      if(ps != null) ps.close();
		      if(rs != null) rs.close();
		  }
		  
		}
		  
		  ///////********Students TABLE ********///////
		    ///////******** Get student data by roll_num  
		  public static ArrayList<String> getComplainCategoryByComplainCatIdAndStdRegId(int complainCatId, int stdRegId)throws Exception{
		  String query =  "SELECT complain_category.category, student.std_name FROM complain JOIN\r\n"
		  		+ "							complain_category ON complain.complain_cat_id =\r\n"
		  		+ "							complain_category.complain_cat_id JOIN registration ON\r\n"
		  		+ "							complain.std_reg_id = registration.std_reg_id JOIN student ON\r\n"
		  		+ "							registration.std_id = student.std_id\r\n"
		  		+ "							WHERE complain.complain_cat_id = "+complainCatId+" AND complain.std_reg_id ="+stdRegId;
			  System.out.println("Query : "+query);
			  java.sql.PreparedStatement ps = null;
			  java.sql.ResultSet rs = null;
			  ArrayList<String> list = null;
			  
			  try{
			      ps = con.prepareStatement(query);
			      rs = ps.executeQuery();
			      if(rs != null){
			          while(rs.next()){
			        	  
			        	  if(list == null)
			        		  list = new ArrayList<String>();
		  	  
			        	  list.add(rs.getString("std_name"));
			        	  list.add(rs.getString("category"));
			        	  
			        	  
			         }
			      }
			      return list;
			  }finally{
			      if(ps != null) ps.close();
			      if(rs != null) rs.close();
			  }
			  
		}


	  
}
