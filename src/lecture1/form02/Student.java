package lecture1.form02;

public class Student {
	String userid;//이름
	String number;//학번
	String name;
	int department;//학과
	int grade;

	public Student(String userid, String number, String name, int department,int grade) {
		this.userid = userid;
		this.number = number;
		this.name = name;
		this.department = department;
		this.grade = grade;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}


	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
