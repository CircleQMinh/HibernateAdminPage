/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ASUS
 */
public class CartItem {
    private int productID;
    private String productName;
    private int quantity;
    private int price;
    
    public CartItem(){
        
    }
    public CartItem(int productID,String productName,int quntity)
    {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
    }
    public int getProductID() {
        return productID;
    }
    public String getProductName() {
        return productName;
    }
    public int getQuantity(){
        return this.quantity;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public void setQuantity(int quantity){
        this.quantity=quantity;
    }
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
