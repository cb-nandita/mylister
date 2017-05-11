package com.packt.webstore.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.packt.webstore.service.EmailService;



@Controller
public class HomeController {
	EmailService email = new EmailService();
	private final Log logger = LogFactory.getLog(getClass().getSimpleName());	
	
@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
public String welcome(Model model) 
   {
      /* model.addAttribute("greeting", "Welcome to Web Store!");
       model.addAttribute("tagline", "The one and only amazing webstore");*/
	   logger.info("welcome page loaded");
	   
       return "welcome";
    }


@RequestMapping(value = "/link", method = RequestMethod.POST)
@ResponseBody
public String commentPost(ModelMap map,@RequestParam(value="title") Object title) {
   System.out.println("controller "+title);
   
   //email.sendComment(data);
	return "success";
}


@RequestMapping(value = { "/success" }, method = RequestMethod.GET)
public String thanku(Model model) 
   {
      /* model.addAttribute("greeting", "Welcome to Web Store!");
       model.addAttribute("tagline", "The one and only amazing webstore");*/
       return "thanku";
    }

@RequestMapping("/home")
public String welcome1(Model model) 
   {
	 
       model.addAttribute("greeting", "Welcome to Web Store!");
       model.addAttribute("tagline", "The one and only amazing webstore");
       return "menu";
    }

@RequestMapping("/error")
public String error(Model model) 
    {
	     
       return "error";
    }



/*@RequestMapping(value = "/test", method = RequestMethod.GET)
@ResponseBody
public Object  menu(Model map,@RequestParam("data") String valueOne,@RequestParam("phint") String phint, @RequestParam("callback") String jsonpCallback) {
	System.out.println("hey..."+phint);
	
	System.out.println("callback..."+jsonpCallback);
	
	return order.getData(phint,jsonpCallback);
	//return jsonpCallback + "(" + value + ")";
}


@RequestMapping("/menu")
public String welcome1(Model model) 
   {
	 
       model.addAttribute("greeting", "Welcome to Web Store!");
       model.addAttribute("tagline", "The one and only amazing webstore");
       return "welcome";
    }

@RequestMapping("/home")
public String welcome2(Model model) 
   {
       model.addAttribute("greeting", "Welcome to Web Store!");
       model.addAttribute("tagline", "The one and only amazing webstore");
       return "home";
    }

@RequestMapping(value = "/link")
@ResponseBody
public String  link(Model model,@RequestParam("data") String valueOne) {
	System.out.println("hey...");	
	String status = order.getStatus(valueOne);
	//return jsonpCallback + "(" + value + ")";
	model.addAttribute("greeting",status);
	return "check";
}
*/


 }