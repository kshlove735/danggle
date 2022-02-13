package kr.co.todaydaeng.diary.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.diary.model.vo.Diary;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Repository
public class DiaryDAO {

	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Dog selectDogInfo(HashMap<String, Integer> map) {
		return sqlSession.selectOne("diary.selectDogInfo", map);
	}

	public ArrayList<Diary> calViewList(HashMap<String, Object> map2) {
		return new ArrayList<Diary>(sqlSession.selectList("diary.calViewList", map2));
	}

	public Diary selectDiary(HashMap<String, Object> map) {
		return sqlSession.selectOne("diary.selectDiary", map);
	}

	public int updateDiary(Diary diary) {
		return sqlSession.update("diary.updateDiary", diary);
	}

	public int insertDiary(Diary diary) {
		return sqlSession.insert("diary.insertDiary", diary);
	}

	public int deleteDiary(Diary diary) {
		return sqlSession.delete("diary.deleteDiary", diary);
	}

}
