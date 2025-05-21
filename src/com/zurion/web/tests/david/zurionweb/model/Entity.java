package com.zurion.web.tests.david.zurionweb.model;

/*
 * This class models an entity, few details from the E_UNIQUE view. Will be used in specific scenarios
 * 
 */
public class Entity {
	private long entityID;		//This is the most suitable container for IDs since Integer cannot accommodate large numbers
	private String column;		//ACTUAL_COLUMN
	private String tableName;	//SOURCE
	
	public Entity() {
		super();
	}

	public long getEntityID() {
		return entityID;
	}

	public void setEntityID(long entityID) {
		this.entityID = entityID;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}

