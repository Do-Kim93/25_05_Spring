package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Address {

	private String address;
	private String road_address;
	private String contract_date;
	private int deposit;
	private int rent;
	private double area;
	private int floor;
	}