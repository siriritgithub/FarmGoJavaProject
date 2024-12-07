package com.klu.jfsd.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Product, Integer> items = new HashMap<>();

    private static Cart instance;

    private Cart() {}

    public static synchronized Cart getInstance() {
        if (instance == null) {
            instance = new Cart();
        }
        return instance;
    }

    public void addItem(Product product, int quantity) {
        items.put(product, quantity);
    }

    public Map<Product, Integer> getItems() {
        return items;
    }
}
