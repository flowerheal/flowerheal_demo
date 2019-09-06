package com.kh.flowerheal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/popup")
public class PopupController {

    private static Logger logger = LoggerFactory.getLogger(PopupController.class);
    
    
    @GetMapping("jusoPopup")
    public String jusoPopup() {
	// GET방식으로 호출하면 주소팝업창이 열리고
	return "popup/jusoPopup";
    }
    
    @PostMapping("jusoPopup")
    public String jusoPopup2() {
	// POST방식으로 호출하면 주소팝업창에 있는 정보를 가져온다.
	return "popup/jusoPopup";
    }
    
}
