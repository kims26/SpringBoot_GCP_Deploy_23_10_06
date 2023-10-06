package demo_final.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo_final.dao.CartDao;
import demo_final.dao.DeliveryDao;
import demo_final.dao.PaymentDao;
import demo_final.service.KakaoPayService;
import demo_final.vo.CartVo;
import demo_final.vo.DeliveryVo;
import demo_final.vo.KakaoApproveResponse;
import demo_final.vo.KakaoReadyResponse;
import demo_final.vo.PaymentParam;
import demo_final.vo.PaymentVo;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayController {

    @Autowired
    PaymentDao paymentDao;

    @Autowired
    CartDao cartDao;

    @Autowired
    DeliveryDao deliveryDao;

    private final KakaoPayService kakaoPayService;

    PaymentParam globalPaymentParam;

    DeliveryVo globalDeliveryVo;

    /**
     * 결제요청
     */
    @PostMapping("/ready")
    public String readyToKakaoPay(PaymentParam payment) {

        // p_idx / mem_idx
        globalPaymentParam = payment;

        KakaoReadyResponse kakaoReadyResponse = kakaoPayService.kakaoPayReady(payment);

        return "redirect:" + kakaoReadyResponse.getNext_redirect_pc_url();
    }

    @PostMapping("/cartReady")
    public String readyToCartKakaoPay(int[] cart_idx, int mem_idx, DeliveryVo deliveryVo) {

        Map map = new HashMap();
        map.put("cart_idx_array", cart_idx);

        // 장바구니 결제 목록구하기
        List<CartVo> list = cartDao.selectListPay(map);

        PaymentParam payment = new PaymentParam();
        for (CartVo vo : list) {
            payment.getItem_name().add(vo.getP_name());
            payment.getP_idx().add(vo.getP_idx());
            payment.getPay_count().add(vo.getCart_num());
            payment.getPay_price().add(vo.getP_saleprice());
            payment.getCart_idx().add(vo.getCart_idx());
            payment.setMem_idx(mem_idx);
        }

        // p_idx / mem_idx
        globalPaymentParam = payment;

        // 배송지 정보
        globalDeliveryVo = deliveryVo;

        KakaoReadyResponse kakaoReadyResponse = kakaoPayService.kakaoPayReady(payment);

        return "redirect:" + kakaoReadyResponse.getNext_redirect_pc_url();
    }

    /**
     * 결제 성공
     */
    @GetMapping("/success")
    public String afterPayRequest(@RequestParam("pg_token") String pgToken, Model model) {

        KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);

        System.out.println("-----[결제결과]-----");

        // 결제정보를 DB저장
        int pay_num = paymentDao.selectPayNum();

        for (int i = 0; i < globalPaymentParam.getItem_name().size(); i++) {

            PaymentVo vo = new PaymentVo();

            vo.setP_idx(globalPaymentParam.getP_idx().get(i));
            vo.setMem_idx(globalPaymentParam.getMem_idx());

            String item_name = globalPaymentParam.getItem_name().get(i);
            vo.setItem_name(item_name);

            int amount = globalPaymentParam.getPay_count().get(i) * globalPaymentParam.getPay_price().get(i);
            vo.setPay_price(amount);

            int quantity = globalPaymentParam.getPay_count().get(i);
            vo.setPay_count(quantity);

            vo.setPay_type("KAKAOPAY");

            vo.setPay_num(pay_num);

            int res = paymentDao.insert(vo);
            System.out.println(res);

            // 결제완료된 장바구니상품 삭제
            cartDao.delete(globalPaymentParam.getCart_idx().get(i));

        }

        // 배송지 정보
        globalDeliveryVo.setPay_num(pay_num);// 결제거래번호

        // 배송지 정보 DB저장
        deliveryDao.insert(globalDeliveryVo);

        model.addAttribute("payment_info", kakaoApprove);
        model.addAttribute("deliveryVo", globalDeliveryVo);

        return "payment/payment_success";
    }

    /**
     * 결제 진행 중 취소
     */
    @GetMapping("/cancel")
    public void cancel() {

        // throw new BusinessLogicException(ExceptionCode.PAY_CANCEL);
    }

    /**
     * 결제 실패
     */
    @GetMapping("/fail")
    public void fail() {

        // throw new BusinessLogicException(ExceptionCode.PAY_FAILED);
    }

}
