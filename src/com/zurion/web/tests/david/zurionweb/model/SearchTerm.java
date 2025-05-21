package com.zurion.web.tests.david.zurionweb.model;

import java.io.Serializable;
import java.sql.Timestamp;

import java.sql.Date;

/**
 * Help with DTO for Search API requests from API client
 */
public class SearchTerm implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String searchType;	// Where/ how to search: individual (default) or by company
	private String searchTerm;	// Will be either the phone hash, or a string of masked name and masked phone number separate by comma
	
	public SearchTerm() {
		super();
	}

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
}

