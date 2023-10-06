package demo_final.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.CommentBoardVo;

@Mapper
public interface CommentBoardDao {
    // 댓글조회
    List<CommentBoardVo> selectList(Map<String, Object> map);

    int selectRowTotal(Map<String, Object> map);

    // 댓글 추가
    int insert(CommentBoardVo vo);

    // 댓글 삭제
    int delete(int c_b_idx);

}
