package kr.co.todaydaeng.myPage.model.vo;

public class Dog {

	private int dogNo;
	private int memberNo;
	private String dogName;
	private char gender;
	private String breed;
	private String dogSize;
	private char neutralization_YN;
	private String vaccination_YN;
	private String birthdate;
	private String dogProfile;

	public Dog() {
		super();
	}

	public Dog(int dogNo, int memberNo, String dogName, char gender, String breed, String dogSize,
			char neutralization_YN, String vaccination_YN, String birthdate, String dogProfile) {
		super();
		this.dogNo = dogNo;
		this.memberNo = memberNo;
		this.dogName = dogName;
		this.gender = gender;
		this.breed = breed;
		this.dogSize = dogSize;
		this.neutralization_YN = neutralization_YN;
		this.vaccination_YN = vaccination_YN;
		this.birthdate = birthdate;
		this.dogProfile = dogProfile;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}

	public char getNeutralization_YN() {
		return neutralization_YN;
	}

	public void setNeutralization_YN(char neutralization_YN) {
		this.neutralization_YN = neutralization_YN;
	}

	public String getVaccination_YN() {
		return vaccination_YN;
	}

	public void setVaccination_YN(String vaccination_YN) {
		this.vaccination_YN = vaccination_YN;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getDogProfile() {
		return dogProfile;
	}

	public void setDogProfile(String dogProfile) {
		this.dogProfile = dogProfile;
	}

	@Override
	public String toString() {
		return "Dog [dogNo=" + dogNo + ", memberNo=" + memberNo + ", dogName=" + dogName + ", gender=" + gender
				+ ", breed=" + breed + ", dogSize=" + dogSize + ", neutralization_YN=" + neutralization_YN
				+ ", vaccination_YN=" + vaccination_YN + ", birthdate=" + birthdate + ", dogProfile=" + dogProfile
				+ "]";
	}

}
