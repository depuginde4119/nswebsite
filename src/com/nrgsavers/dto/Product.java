package com.nrgsavers.dto;

public class Product extends DBComponent {
	
	int id;
	String name;
	String description;
	String image;
	boolean addedToCart=false;

	public boolean isAddedToCart() {
		return addedToCart;
	}
	public void setAddedToCart(boolean addedToCart) {
		this.addedToCart = addedToCart;
	}
	double price;
	String specification;
	
//	Product Type details
	
//	The id of product type for which this product belongs to  in DB
	int typeId;
	String typeName;
	String typeDescription;

	
//	Getters And setters of the Varibles 
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeDescription() {
		return typeDescription;
	}
	/**
	 * @param typeDescription
	 */
	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}
	@Override
	public String toString() {
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("Product DB Component :\n ");
		buffer.append("ID :"+this.id);
		buffer.append("Name :"+this.name);
		buffer.append("Description :"+this.description);
		buffer.append("Image :"+this.image);
		buffer.append("Price :"+this.price);
		buffer.append("Specification :"+this.specification);
		buffer.append("Type Id :"+this.typeId);
		buffer.append("Type Description :"+this.typeDescription);
		buffer.append("Type Name :"+this.typeName);
		return buffer.toString();
	}
	
}
