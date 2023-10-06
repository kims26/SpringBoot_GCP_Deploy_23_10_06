package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.MemberVo;
import demo_final.vo.PaymentVo;

@Mapper
public interface MemberDao {

    public List<MemberVo> selectList();

    public MemberVo selectOneFromIdx(int mem_idx);

    public MemberVo selectOneFromId(String mem_id);

    public MemberVo selectOneNaverEmail(String mem_email);

    public int insert(MemberVo vo);

    public int update(MemberVo vo);

    public int delete(int mem_idx);

    public List<PaymentVo> selectOrderFromIdx(int mem_idx);

}
