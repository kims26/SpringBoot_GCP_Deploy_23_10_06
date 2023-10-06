package demo_final.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class PaymentParam {

    // String[] item_name;
    // int[] pay_count;
    // int[] pay_price;
    // int[] p_idx;

    List<String> item_name = new ArrayList<String>();
    List<Integer> pay_count = new ArrayList<Integer>();
    List<Integer> pay_price = new ArrayList<Integer>();
    List<Integer> p_idx = new ArrayList<Integer>();

    List<Integer> cart_idx = new ArrayList<Integer>();

    int mem_idx;

}
