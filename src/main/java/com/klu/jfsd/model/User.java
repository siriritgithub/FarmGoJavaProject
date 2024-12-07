package com.klu.jfsd.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_table")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Increment numbers automatically
    @Column(name = "user_id", nullable = false, unique = true)
    private int id;

    @Column(name = "user_name", nullable = false)
    private String name;

    @Column(name = "user_phone", nullable = false)
    private String phone;

    @Column(name = "user_username", nullable = false, unique = true)
    private String username;

    @Column(name = "user_password", nullable = false)
    private String password;

    @Column(name = "user_address", nullable = false)
    private String address;

    @Column(name = "user_state", nullable = false)
    private String state;

    @Column(name = "user_city", nullable = false)
    private String city;

    @Column(name = "user_image_url", nullable = true)
    private String imageUrl; // Store image URL instead of byte[]

    @Column(name = "user_approval")
    private boolean userApproval;

    // Getters and Setters
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isUserApproval() {
        return userApproval;
    }

    public void setUserApproval(boolean userApproval) {
        this.userApproval = userApproval;
    }
}
