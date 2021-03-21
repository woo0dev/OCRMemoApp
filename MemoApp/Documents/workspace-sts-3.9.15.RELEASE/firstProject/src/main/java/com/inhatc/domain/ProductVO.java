package com.inhatc.domain;

public class ProductVO { // class 선언 
	
	private String name; // name
	private double price; // price
	
	public ProductVO(String name, double price) 
	{
		super();
		this.name = name; // name 저장 
		this.price = price; // price 저장 
	}

	public String getName() { // name getter
		return name;
	}

	public void setName(String name) { // name setter
		this.name = name;
	}

	public double getPrice() { // price getter
		return price;
	}

	public void setPrice(double price) { // price setter
		this.price = price;
	}
	

}
