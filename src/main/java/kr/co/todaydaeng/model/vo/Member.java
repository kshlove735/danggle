package kr.co.todaydaeng.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String authProvider;
	private String memberNickname;
	private char gender;
	private String birthdate;
	private String email;
	private String address;
	private String detailAddress;
	private Date enrollDate;
	private char memberStatus;
	private char dogYN;
	
	public Member() {
		super();
	}

	public Member(int memberNo, String memberId, String memberPwd, String authProvider, String memberNickname,
			char gender, String birthdate, String email, String address, String detailAddress, Date enrollDate,
			char memberStatus, char dogYN) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.authProvider = authProvider;
		this.memberNickname = memberNickname;
		this.gender = gender;
		this.birthdate = birthdate;
		this.email = email;
		this.address = address;
		this.detailAddress = detailAddress;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
		this.dogYN = dogYN;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getAuthProvider() {
		return authProvider;
	}

	public void setAuthProvider(String authProvider) {
		this.authProvider = authProvider;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(char memberStatus) {
		this.memberStatus = memberStatus;
	}

	public char getDogYN() {
		return dogYN;
	}

	public void setDogYN(char dogYN) {
		this.dogYN = dogYN;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", authProvider=" + authProvider + ", memberNickname=" + memberNickname + ", gender=" + gender
				+ ", birthdate=" + birthdate + ", email=" + email + ", address=" + address + ", detailAddress="
				+ detailAddress + ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus + ", dogYN=" + dogYN
				+ "]";
	}
}
