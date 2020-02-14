package com.kh.petmily.controller.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay")
public class PayController {

	@GetMapping("/account")
	public String account() {
		return "pay/account";
	}
}
