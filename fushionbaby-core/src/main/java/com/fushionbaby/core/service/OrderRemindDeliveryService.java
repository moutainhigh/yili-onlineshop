package com.fushionbaby.core.service;

import com.fushionbaby.core.model.OrderRemindDelivery;

public interface OrderRemindDeliveryService <T extends OrderRemindDelivery>{
	
	void add(OrderRemindDelivery orderRemindDelivery);
	
    void updateByMemberIdAndOrderCode(OrderRemindDelivery orderRemindDelivery);

    OrderRemindDelivery findByMemberIdAndOrderCode(Long memberId, String orderCode);
	

}
