package com.jwt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jwt.service.PersonService;


@Controller
public class PersonController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/personList")
	public String list(Model model, Integer offset, Integer maxResults){
		model.addAttribute("persons", personService.list(offset, maxResults));
		model.addAttribute("count", personService.count());
		model.addAttribute("offset", offset);
		return "list2";
	}
	
	@RequestMapping(value="/save")
	public String save(){
		personService.save();
		return "list2";
	}
	
}
