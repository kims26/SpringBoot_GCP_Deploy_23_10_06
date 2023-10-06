package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.CategoryVo;

@Mapper
public interface CategoryDao {

      public List<CategoryVo> selectList();

      // public List<CategoryVo> selectList(int p_idx);

}
