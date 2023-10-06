package demo_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/")
public class MainController {

    @RequestMapping("main.do")
    public String main() {

        return "main/main";
    }

}