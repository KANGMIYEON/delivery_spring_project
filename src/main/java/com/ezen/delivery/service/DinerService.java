package com.ezen.delivery.service;

import java.util.List;

import com.ezen.delivery.domain.ReviewDTO;
import com.ezen.delivery.domain.DinerVO;

public interface DinerService {

	List<DinerVO> getList();
	
	//이미지파일(diner컨트롤러랑 연결)
//	int reviewFile(ReviewDTO rdto); 

	DinerVO getDiner(int diner_code);






}
