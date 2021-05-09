package com.company.cart.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.cart.service.CartService;
import com.company.cart.service.CartVO;
import com.company.mentor.service.MentorService;
import com.company.mentoring.service.MentoringVO;

@Controller
public class CartController {

	@Autowired CartService cartservice;
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest req, CartVO vo, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		model.addAttribute("list", cartservice.getSearchCartList(vo));
		System.out.println("cart list VO: "+vo);
		return "cart";
	}
	
	@PostMapping("/insertCart")
	public String insertCart(HttpServletRequest req, CartVO vo, HttpSession session, MentoringVO mentovo, Model model) {
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		String mentor_id = req.getParameter("mentor_id");
		vo.setMentor_id(mentor_id);
		int result = cartservice.countCart(vo);    //중복체크(동일한 상품이면 담기지 않음)
		if(result == 0) {
			cartservice.insertCart(vo);
			System.out.println("insert VO: "+vo);
			return "redirect:/cart";
		}else {
			model.addAttribute("msg", "이미 존재하는 상품입니다.");
			model.addAttribute("url", "cart");
			return "common/Fail";
		}
	}
	
	//cart에서 배열로 받아온 값을 넘겨서 삭제 
	@RequestMapping("/deleteCart")
	public String deleteCart(CartVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		String[] ajaxMsg = req.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i = 0; i < size; i++) {
			cartservice.deleteCart(ajaxMsg[i]);
		}
		return "cart";
	}
	
	@RequestMapping("/getCart")
	public String getCart(CartVO vo) {
		cartservice.getCart(vo);
		return "";
	}
	
	@PostMapping("/deleteCartAll")
	public String deleteCartAll(CartVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		cartservice.deleteCartAll(vo);
		return "redirect:/cart";
	}
	
	@RequestMapping("/deleteSub")
	public String deleteSub(CartVO vo, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		cartservice.deleteSub(vo);
		model.addAttribute("cartlist", cartservice.deleteSub(vo));
		return "redirect:/cart";
	}
	
}
