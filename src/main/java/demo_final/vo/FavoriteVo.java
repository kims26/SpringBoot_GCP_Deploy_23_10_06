package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FavoriteVo {

    int f_idx;
    int marker_idx;
    int csId;
    String csNm;
    String addr;
    int cpTp;
    int chargeTp;
    int cpStat;
    String statUpdateDatetime;
    double f_lat;
    double f_longi;
    int mem_idx;

    int count;

}
