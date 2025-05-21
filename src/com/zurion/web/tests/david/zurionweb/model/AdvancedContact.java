package com.zurion.web.tests.david.zurionweb.model;

import java.io.Serializable;
import java.sql.Timestamp;

import java.sql.Date;

public class AdvancedContact implements Serializable {
	private static final long serialVersionUID = 1L;
	private int contactId;
	private String fullName;
	private String maskedName;
	private String phone;
	private String phoneMask;
	private String phoneHash;
	private String email;
	private int idNumber;
	private Date dateOfBirth;
	private String gender;
	private String organization;
	private Timestamp dateCreated;
	private String comments;
	private String status;

	public AdvancedContact() {
		super();
	}

	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMaskedName() {
		return maskedName;
	}

	public void setMaskedName(String maskedName) {
		this.maskedName = maskedName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoneMask() {
		return phoneMask;
	}

	public void setPhoneMask(String phoneMask) {
		this.phoneMask = phoneMask;
	}

	public String getPhoneHash() {
		return phoneHash;
	}

	public void setPhoneHash(String phoneHash) {
		this.phoneHash = phoneHash;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(int idNumber) {
		this.idNumber = idNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdvancedContact [contactId=" + contactId + ", fullName=" + fullName + ", maskedName=" + maskedName
				+ ", phone=" + phone + ", phoneMask=" + phoneMask + ", phoneHash=" + phoneHash + ", email=" + email
				+ ", idNumber=" + idNumber + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender + ", organization="
				+ organization + ", dateCreated=" + dateCreated + ", comments=" + comments + ", status=" + status + "]";
	}

}

