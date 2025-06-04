package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.AddressRepository;
import com.example.demo.vo.Address;

@Service
public class AddressService {

	@Autowired
	private AddressRepository addressRepository;
	
	public List<Address> getForPringAdress(String ad, int flor) {
		return addressRepository.getForPringAdress(ad, flor);
	}

}
