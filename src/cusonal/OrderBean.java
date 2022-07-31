package cusonal;

public class OrderBean {
	
	private int num = 0;
    private int product_num = 0;
    private int quantity = 0;
    private String date = null;
    private String state = null;
    private String id = null;
	
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    
    
}