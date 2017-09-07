package com.kosta.inhair.dao.mapper;

import java.util.List;

import com.kosta.inhair.domain.Designer;

public interface DesignerMapper {
	// 디자이너 가입
		int designerCreate(Designer designer);

		// 디자이너 수정
		int designerUpdate(Designer designer);

		// 디자이너 검색(Detail)
		Designer designerSearch(String designer_id);
		
		// 디자이너 이름검색(예약 시 사용)
		Designer designerSearchByName(String shopCode, String designer_name);

		// 디자이너 탈퇴
		int designerDelete(String id);

		// 디자이너 소속삭제
		int designerOut(String id);

		// 모든 디자이너 검색
		List<Designer> designerList();

		// 지역별 디자이너 검색
		List<Designer> designerListByAddress(String gu);

		// 중복검사
		boolean idDesignerCheck(String id);

		// 헤어샵 소속 디자이너
		List<Designer> designerListByHairshop(String shopCode);
		
		// 일자 별 헤어샵 소속 디자이너 스케줄 리스트
		List<Designer> designerListByDate(String shopCode, int days);
		
		// 디자이너 헤어샵 등록시 샵코드 체크
		boolean shopCodeCheck(String shopCode);
}
