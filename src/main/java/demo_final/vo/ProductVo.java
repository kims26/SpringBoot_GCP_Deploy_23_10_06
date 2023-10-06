package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVo {

    int p_idx;
    int p_number;
    String p_name;
    int p_price;
    int p_saleprice;
    String p_image_s;
    String p_image_l;
    String p_content;
    String p_regdate;
    String p_modifydate;
    int category_idx;
    int o_idx;

}
