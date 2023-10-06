package demo_final.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.CartVo;

@Mapper

public interface CartDao {

	List<CartVo> selectList(int mem_idx);

	// 결제물품조회
	List<CartVo> selectListPay(Map map);

	// 장바구니 총액
	int selectTotalAmount(int mem_idx);

	// 결제 총액
	int selectPaymentTotalAmount(Map map);

	int update(CartVo vo);

	int delete(int cart_idx);

	int deleteMap(Map map);

	CartVo selectOne(CartVo vo);

	int insert(CartVo vo);

	int paymentForm(Map map);

}
