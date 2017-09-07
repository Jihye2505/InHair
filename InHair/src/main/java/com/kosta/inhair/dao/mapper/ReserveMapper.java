package com.kosta.inhair.dao.mapper;

import java.util.List;

import com.kosta.inhair.domain.Reserve;

public interface ReserveMapper {

	// 고객 예약 등록
	int createReserve(Reserve reserve);

	// 관리자 예약 등록
	int adminCreateReserve(Reserve reserve);

	// 예약 취소
	int deleteReserve(int reserve_id);
	
	// 디자이너 이름검색(예약 시 사용)
	Reserve designerSearchByName(String shopCode, String designer_name);

	// 헤어샵 별 전체 예약 리스트
	List<Reserve> reserveList(String shopCode);

	// 디자이너별 예약 리스트(join문)
	List<Reserve> reserveListByDesigner(String designer_id);

	// 개인 예약 현황
	List<Reserve> reserveListByUser(String user_id);
}
