package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentVo {

    int pay_idx;
    int pay_num;
    // int pay_p_num;
    int pay_count;
    int pay_price;
    String pay_type;
    String pay_regdate;
    int p_idx;
    int mem_idx;
    String item_name;

}
