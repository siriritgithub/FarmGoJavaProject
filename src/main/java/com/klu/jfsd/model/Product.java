package com.klu.jfsd.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "product_table")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false, unique = true)
    private int id;

    @Column(name = "product_name", nullable = false, unique = false)
    private String name;

    @Column(name = "product_specification", nullable = false, unique = false)
    private String specification;

    @Column(name = "product_type", nullable = false, unique = false)
    private String type;

    @Column(name = "product_price", nullable = false, unique = false)
    private double price;

    @Column(name = "product_quantity", nullable = false, unique = false)
    private String quantity = "0";
    
    @Column(name = "producer_city", nullable = false, unique = false)
    private String city;
    
    @Column(name = "producer_state", nullable = false, unique = false)
    private String state;

    @Column(name = "producer_contact", nullable = false, unique = false)
    private String contact;

    @Column(name = "product_Date", nullable = false, unique = false)
    private String Date;
    
    @Column(name = "producer_location", nullable = false)
    private String location;


    

    

	@Column(name = "product_farmer_id", nullable = false)
    private Integer farmerId = -1 ;
    
    @Column(name="product_image",nullable = false)
    private Blob image;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getCity() {
	    return city;
	}

	public void setCity(String city) {
	    this.city = city;
	}

	public String getState() {
	    return state;
	}

	public void setState(String state) {
	    this.state = state;
	}

	

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public Integer getFarmerId() {
		return farmerId;
	}

	public void setFarmerId(Integer farmerId) {
		this.farmerId = farmerId;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	} // blob - binary large object

    // Add a reference to the Farmer entity
   
}