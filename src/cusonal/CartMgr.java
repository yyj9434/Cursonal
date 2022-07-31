package cusonal;

import java.util.Hashtable;

public class CartMgr {

    private Hashtable hCart = new Hashtable();

    public CartMgr() {
    }

    public void addCart(OrderBean order) {
        int product_num = order.getProduct_num();
        int quantity = order.getQuantity();
        if (quantity > 0) {
            if (hCart.containsKey(product_num)) {
                OrderBean tempOrder = (OrderBean) hCart.get(product_num);
                quantity += tempOrder.getQuantity();
                tempOrder.setQuantity(quantity);
                hCart.put(product_num, tempOrder);
            } else {
                hCart.put(product_num, order);
            }
        }
    }

    public Hashtable getCartList() {
        return hCart;
    }

    public void updateCart(OrderBean order) {
        int product_num = order.getProduct_num();
        hCart.put(product_num, order);
    }


    public void deleteCart(OrderBean order) {
        int product_num = order.getProduct_num();
        hCart.remove(product_num);
    }

}