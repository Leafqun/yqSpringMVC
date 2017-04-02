package com.leafqun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leafqun.entity.Login;
import com.leafqun.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public String loginCheck(HttpServletRequest request, String username,
			String password,Model model) throws Exception {

		if (username != null && password != null && !username.trim().equals("")) {
			Login login = loginService.selectByPrimaryKey(username);
			if (login != null) {
				if (username.equalsIgnoreCase(login.getUsername())
						&& password.equalsIgnoreCase(login.getPassword())) {
					HttpSession session = request.getSession();
					String SessionLoginCode = "username";
					session.setAttribute(SessionLoginCode, username);
					return "redirect:/items/queryItems.html";
				}
			}
		}
		model.addAttribute("message", "用户名或密码错误！");
		return "login";

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login.html";
	}

	@RequestMapping(value = "/register", method = { RequestMethod.GET })
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/register", method = { RequestMethod.POST })
	public String registerSubmit(Model model,Login login) throws Exception {
		if(login!=null){
			Login user=loginService.selectByPrimaryKey(login.getUsername());
			if(user==null){
				loginService.insert(login);
				return "success";
			}	
		}
		model.addAttribute("message", "用户名已存在");
		return "error";
	}

}
