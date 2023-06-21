package com.dds.app.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
	@RequestMapping("dashboard/dashboard")
	public String board() {
		return "dashboard/dashboard";
	}
}