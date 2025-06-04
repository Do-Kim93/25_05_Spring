package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Address;

@Mapper
public interface AddressRepository {

	public List<Address> getForPringAdress(String ad, int flor);

}
