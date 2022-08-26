package net.koreate.greatescape.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import net.koreate.greatescape.product.service.ProductService;
import net.koreate.greatescape.product.vo.ProductVO;
import net.koreate.greatescape.reservation.service.ReservationService;
import net.koreate.greatescape.reservation.vo.ReservationVO;

@Controller
@RequiredArgsConstructor
@RequestMapping("product")
public class ReservationController {

	private final ReservationService rs;
	private final ProductService ps;
		
	
	
}