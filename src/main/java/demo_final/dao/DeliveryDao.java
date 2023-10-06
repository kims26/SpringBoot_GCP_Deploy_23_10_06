package demo_final.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.DeliveryVo;

@Mapper
public interface DeliveryDao {

    List<DeliveryVo> selectList(Map map);

    int insert(DeliveryVo vo);

}
