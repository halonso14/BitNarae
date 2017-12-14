package com.tripster.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tripster.domain.ContentsReviewVO;
import com.tripster.domain.Criteria;

@Repository
public class ContentsReviewDAOImpl implements ContentsReviewDAO{
	//DB 연결
	@Inject
	private SqlSession session;
	//DB 조회 Mapper 명시
	private static String namespace = "com.tripster.mapper.ContentsReviewMapper";
	
	@Override
	public void write(ContentsReviewVO vo) throws Exception {
		session.insert(namespace + ".write", vo);
	}
	
	@Override
	public void modify(ContentsReviewVO vo) throws Exception {
		session.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(Integer reviewID) throws Exception {
		session.delete(namespace + ".delete", reviewID);
	}
	
	//컨텐츠 리뷰 리스트 조회
	@Override
	public List<ContentsReviewVO> getContentsReviewList(Integer contentsID, Criteria cri) throws Exception {
		//ContentsID, Criteria 객체를 전달할 Map 객체 생성 
		Map<String, Object> paramMap = new HashMap<>();
		
		//Map 객체에 ContentsID, Criteria 객체 저장
		paramMap.put("contentsID", contentsID);
		paramMap.put("cri", cri);
		//쿼리 결과 반환
		return session.selectList(namespace + ".getContentsReviewList", paramMap);
	}
	
	//컨텐츠 총 리뷰 개수 조회
	@Override
	public int getTotalContentsReviewNum(Integer contentsID) throws Exception {
		//쿼리 결과 반환
		return session.selectOne(namespace + ".getTotalContentsReviewNum", contentsID);
	}
	
	//리뷰 대상 컨텐츠의 ID 조회
	@Override
	public int getContentsID(Integer contentsReviewID) throws Exception {
		return session.selectOne(namespace + ".getContentsID", contentsReviewID);
	};
}