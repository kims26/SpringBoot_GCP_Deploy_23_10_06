package demo_final.dao;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.PaymentVo;

@Mapper
public interface PaymentDao {

    public int insert(PaymentVo vo);

    public int selectPayNum();

}
