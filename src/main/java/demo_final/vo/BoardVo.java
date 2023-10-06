package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVo {

    int b_idx;
    int comment_count;
    String b_subject;
    String b_content;
    String b_ip;
    String b_regdate;
    int mem_idx;
    String mem_name;
    int b_readhit;
    int b_ref;
    int b_step;
    int no;
}
