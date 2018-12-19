package com.ajax.app.bean;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCar {

	private Map<String, ShoppingCarItem> items = new HashMap<>();

	private String bookName;
	
	public void addCar(String bookName, int price) {
		
		this.bookName = bookName;
		
		if(items.containsKey(bookName)) {
			
			ShoppingCarItem item = items.get(bookName);
			item.setCount(item.getCount() + 1);
			
		} else {
			
			ShoppingCarItem item = new ShoppingCarItem();
			item.setBookName(bookName);
			item.setCount(1);
			item.setPrice(price);
			items.put(bookName, item);
			
		}
		
	}
	
	public String getBookName() {
		
		return bookName;
		
	}
	
	public int getTotalNumber() {
		
		int count = 0;
		
		for(ShoppingCarItem item : items.values()) {
			
			count += item.getCount();
			
		}
		
		return count;
		
	}
	
	public int getTotalPrice() {
		
		int price = 0;
		
		for(ShoppingCarItem item : items.values()) {
			
			price += item.getPrice() * item.getCount();
			
		}
		
		return price;
		
	}
	
}
