package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.FavoriteVo;

@Mapper
public interface FavoriteDao {

    List<FavoriteVo> selectList(int mem_idx);

    int c_selectList(int mem_idx);

    int insert(FavoriteVo vo);

    int delete(int f_idx);

}
