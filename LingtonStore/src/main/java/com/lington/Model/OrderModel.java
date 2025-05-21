package com.lington.Model;

import java.util.Date;
import java.util.List;

public class OrderModel {
    private int orderId;
    private int userId;
    private double totalAmount;
    private String paymentStatus;
    private String shippingStatus;
    private Date orderDate;
    private Date deliveryDate;
    private List<Cartitemmodel> items;

    public OrderModel() {}

    public OrderModel(int userId, double totalAmount, Date orderDate, List<Cartitemmodel> items) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.paymentStatus = "Pending";
        this.shippingStatus = "Pending";
        this.items = items;
    }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getShippingStatus() { return shippingStatus; }
    public void setShippingStatus(String shippingStatus) { this.shippingStatus = shippingStatus; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public Date getDeliveryDate() { return deliveryDate; }
    public void setDeliveryDate(Date deliveryDate) { this.deliveryDate = deliveryDate; }

    public List<Cartitemmodel> getItems() { return items; }
    public void setItems(List<Cartitemmodel> items) { this.items = items; }
}
