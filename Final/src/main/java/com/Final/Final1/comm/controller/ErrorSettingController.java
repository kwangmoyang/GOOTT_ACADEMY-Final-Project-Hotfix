package com.Final.Final1.comm.controller;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//404, 500에러 발생시 jsp파일 이동
@Controller
public class ErrorSettingController {
    
    private static Logger LOGGER = LoggerFactory.getLogger(ErrorSettingController.class);
    
    @RequestMapping("/error404")
    public String Error404(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 404 PAGE ==========");
        model.addAttribute("code", "ERROR_404");
        return "Error/404";
    }
    
    @RequestMapping("/error500")
    public String Error500(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 500 PAGE ==========");
        model.addAttribute("code", "ERROR_500");
        return "Error/500";
    }
}