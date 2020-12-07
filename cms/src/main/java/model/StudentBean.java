package model;

public class StudentBean {

    private int stdId;
    private String name;
    private String fatherName;
    private String surname;
    private String religion;
    private String country;
    private String gender;
    private String rollNum;
    private String department;
    private String program;
    private String batch;

    public StudentBean() {
    }

    public StudentBean(int stdId, String name, String fatherName, String surname, String religion, String country, String gender, String rollNum, String department, String program, String batch) {
        this.stdId = stdId;
        this.name = name;
        this.fatherName = fatherName;
        this.surname = surname;
        this.religion = religion;
        this.country = country;
        this.gender = gender;
        this.rollNum = rollNum;
        this.department = department;
        this.program = program;
        this.batch = batch;
    }

    public int getstdId() {
        return stdId;
    }

    public void setstdId(int stdId) {
        this.stdId = stdId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getfatherName() {
        return fatherName;
    }

    public void setfatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getrollNum() {
        return rollNum;
    }

    public void setrollNum(String rollNum) {
        this.rollNum = rollNum;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

	
}
