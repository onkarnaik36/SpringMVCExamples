package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwt.dao.PersonDAO;
import com.jwt.model.Person;

@Service
public class PersonService {

	@Autowired
	private PersonDAO personDAO;
	
	
	public List<Person> list(Integer offset, Integer maxResults){
		return personDAO.list(offset, maxResults);
	}
	
	public Long count(){
		return personDAO.count();
	}
	
	public void save(){
		personDAO.save();
	}
	
}
