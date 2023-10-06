package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import demo_final.vo.OwnerVo;
import demo_final.vo.ProductVo;

@Mapper
public interface OwnerDao {

    public List<OwnerVo> selectList();

    public List<ProductVo> selectOne();

    public OwnerVo selectOneFromIdx(int o_idx);

    public ProductVo selectOneIdx(int p_idx);

    public ProductVo selectOne(int p_idx);

    public OwnerVo selectOneFromId(String o_id);

    public int insert(OwnerVo vo);

    public int update(OwnerVo vo);

    public int delete(int o_idx);

    public int insertPendingOwner(OwnerVo vo);

    public int updateApprovalStatus(@Param("o_idx") int o_idx, @Param("approvalStatus") String approvalStatus);

    public List<OwnerVo> getOwnersByApprovalStatus(String approvalStatus);
}
