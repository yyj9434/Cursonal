package cusonal;

import java.sql.*;

public class ProductBean {
	
	private String stock = null;
    private String price = null;
    private String name = null;
    private String detail = null;
    private String date = null;
    private String image = null;
	private int num = 0;
    
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}   

	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
    
}
