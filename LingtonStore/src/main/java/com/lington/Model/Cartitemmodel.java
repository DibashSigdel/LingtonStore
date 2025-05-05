package com.lington.Model;

public class Cartitemmodel {
    private productmodel product;
    private int quantity;

    public Cartitemmodel(productmodel product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public productmodel getProduct() {
        return product;
    }

    public void setProduct(productmodel product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
