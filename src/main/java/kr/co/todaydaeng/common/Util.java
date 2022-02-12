package kr.co.todaydaeng.common;

import java.util.Calendar;
import java.util.HashMap;

public class Util {

	public static HashMap<String, Integer> calendar(String year, String month) {
		
		// 달력에 표현될 년, 월 정보 설정
		int yearInt = 0;
		int monthInt = 0;
		
		Calendar cal = Calendar.getInstance();
		if (year == null || month == null) { // 처음 호출 할때 현재 년, 월로 설정

			yearInt = cal.get(Calendar.YEAR);
			monthInt = cal.get(Calendar.MONTH) + 1;
		} else {
			// 크기 비교를 위해 정수형으로 변환
			yearInt = Integer.parseInt(year);
			monthInt = Integer.parseInt(month);

			// 월이 증가 하다가 12보다 커지면 13,14.. 넘어가는 현상 처리
			if (monthInt > 12) {
				monthInt = 1; // 1월로 변경
				yearInt++; // 년도는 다음해로 변경
			}
			if (monthInt < 1) {
				monthInt = 12;
				yearInt--;
			}

		}
		
		// 현재 월 의 1일에 대한 요일 구하기 : 1~7 -> 1(일)~7(토)
		// set(y, month-1, 1) --> month-1: calendar 기준(0~11), 우리기준 (1~12)
		cal.set(yearInt, monthInt - 1, 1); // 원하는 날짜로 넣어 준다
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

		// 현재 월의 마지막 날 구하기
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		HashMap<String, Integer> calMap = new HashMap<>();
		calMap.put("year", yearInt);
		calMap.put("month", monthInt);
		calMap.put("dayOfWeek", dayOfWeek);
		calMap.put("lastDay", lastDay);
		
		return calMap;
	}

	// 1자리 문자열을 2자리 문자열로 변환하는 메소드
	public static String isTwo(String msg) {
		return (msg.length() < 2 ? "0" + msg : msg);
	}
}
