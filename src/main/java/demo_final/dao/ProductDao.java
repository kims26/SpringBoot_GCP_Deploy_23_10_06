
package demo_final.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.ProductVo;

@Mapper
public interface ProductDao {

    public List<ProductVo> selectList();

    public List<ProductVo> selectOwnerList(int o_idx);

    public List<ProductVo> selectCategoryList(int category_idx);

    public ProductVo selectOne(int p_idx);

    public ProductVo selectOneIdx(int o_idx);

    public int insert(ProductVo vo);

    public int delete(int p_idx);

    public int update(ProductVo vo);

    public int update_filename(ProductVo vo);

}
