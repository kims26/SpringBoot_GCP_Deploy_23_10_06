package demo_final.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import demo_final.vo.BoardVo;

@Mapper
public interface BoardDao {

    List<BoardVo> selectList();

    // 게시글 페이징
    List<BoardVo> selectConditionList(Map<String, Object> map);

    // 조건검색

    // 전체 게시물 수
    int selectRowTotal(Map<String, Object> map);

    BoardVo selectOne(int b_idx);

    // 새글쓰기
    int insert(BoardVo vo);

    // 답글쓰기
    int reply(BoardVo vo);

    int selectComment(int b_idx);

    // 조회수 증가
    int update_readhit(int b_idx);

    // 기준글보다 b_step이 큰게시물의 b_step 1씩 증가
    int update_step(BoardVo baseVo);

    // 수정
    int update(BoardVo vo);

    // 삭제
    int delete(int b_idx);

}
