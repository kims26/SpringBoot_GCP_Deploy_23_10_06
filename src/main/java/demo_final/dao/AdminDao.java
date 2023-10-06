package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.AdminVo;
import demo_final.vo.MemberVo;

@Mapper
public interface AdminDao {

    public List<AdminVo> selectList();



 //public List<AdminVo> selectOwnerList(int o_idx);
   

    public List<MemberVo> selectOne();

    public AdminVo selectOneIdx(int o_idx);

    public AdminVo selectOneFromIdx(int admin_idx);

    
    public MemberVo selectOne(int mem_idx);

 

    public AdminVo selectOneFromId(String admin_id);

    public int insert(AdminVo vo);

    public int update(AdminVo vo);

    public int delete(int admin_idx);
    

    
}
