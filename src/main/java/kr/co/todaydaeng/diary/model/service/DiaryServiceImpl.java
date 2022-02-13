package kr.co.todaydaeng.diary.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.diary.model.dao.DiaryDAO;
import kr.co.todaydaeng.diary.model.vo.Diary;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDAO dDAO;

	@Override
	public Dog selectDogInfo(HashMap<String, Integer> map) {
		return dDAO.selectDogInfo(map);
	}

	@Override
	public ArrayList<Diary> calViewList(HashMap<String, Object> map2) {
		return dDAO.calViewList(map2);
	}

	@Override
	public Diary selectDiary(HashMap<String, Object> map) {
		return dDAO.selectDiary(map);
	}

	@Override
	public int updateDiary(Diary diary) {
		return dDAO.updateDiary(diary);
	}

	@Override
	public int insertDiary(Diary diary) {
		return dDAO.insertDiary(diary);
	}

	@Override
	public int deleteDiary(Diary diary) {
		return dDAO.deleteDiary(diary);
	}

}
