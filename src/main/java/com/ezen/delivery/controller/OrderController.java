package com.ezen.delivery.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.delivery.domain.OrderDTO;
import com.ezen.delivery.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/order/*")
@Controller
public class OrderController {
	
	@Inject
	private OrderService osv;
	
	@GetMapping("/order/{user_id}")
	public void orderPageGet(@PathVariable("user_id") String user_id, OrderDTO odto, Model model) {
		
		log.info(">>> user_id" + user_id);
		log.info(">>> orders : " + odto.getOrders());
		
	}

}