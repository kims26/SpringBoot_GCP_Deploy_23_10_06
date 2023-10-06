package demo_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class PaymentController {

    @RequestMapping("/payment/list.do")
    public String list(Model model) {

        return "payment/payment_list";
    }

}