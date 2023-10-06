package demo_final.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChargeVo {

    int cpId; // 충전기 ID
    String cpNm; // 충전기 명칭
    String chargeTp; // 충전기 타입
    int cpStat; // 충전기 상태 코드
    String statUpdateDatetime; // 충전기 상태 갱신 시각

    int csId; // 충전소ID
    String csNm; // 충전소명
    String addr; // 충전소 주소
    int cpTp; // 충전방식(충전소가 보유중인)

    double lat; // 위도(y)
    double longi; // 경도(x)

    double path_lat; // 경로 위도(y)
    double path_longi; // 경로 경도(x)

}
