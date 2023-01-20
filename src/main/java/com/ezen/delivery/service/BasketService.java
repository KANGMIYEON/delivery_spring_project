package com.ezen.delivery.service;

import java.util.List;

import com.ezen.delivery.domain.BasketDTO;
import com.ezen.delivery.domain.BasketListDTO;

public interface BasketService {

	public int addBasket(BasketDTO basket);

	public List<BasketDTO> getList(String user_id);

	public int removeByBasketCode(int basket_code);

	public int modifyCount(BasketDTO basket);

	public int getDinerCode(String user_id);

	public BasketListDTO getBasketListDTO(String user_id);
	
}
