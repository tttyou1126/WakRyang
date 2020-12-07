package first.sample.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import first.sample.vo.BoardVO;

@Repository("sampleDAO")
public class SampleDAOImpl implements SampleDAO {
	// SqlSession 객체를 스프링에서 생성하여 주입시켜준다.
    // 의존관계 주입(Dependency Injection, DI)
    // 느스한 결함
    // IoC(Inversion of Control, 제어의 역전)
    // Inject애노테이션이 없으면 sqlSession은 null상태이지만
    // Inject애노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword) {
		   // 검색옵션, 키워드 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	 // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
	    return sqlSession.selectList("sample.boardList", map);
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return sqlSession.selectOne("sample.countArticle", map);
	}	
	
/*
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sample.boardList");
	}
*/
	
	@Override
	public void writeBoard(BoardVO vo) {
		sqlSession.insert("sample.insertBoard", vo);
	}

	@Override
	public BoardVO viewBoard(int IDX) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sample.selectBoardDetail", IDX);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sqlSession.update("sample.updateBoard", vo);
		
	}

	@Override
	public BoardVO updateScreenBoard(int iDX) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sample.UpdateBoardDetail", iDX);
	}

	@Override
	public void updateHitCnt(int iDX) {
		sqlSession.update("sample.updateHitCnt", iDX);
		
	}

	@Override
	public void deleteBoard(int iDX) {
		sqlSession.update("sample.insertDelBoard", iDX);
		sqlSession.delete("sample.deleteBoard", iDX);
		
	}




}
