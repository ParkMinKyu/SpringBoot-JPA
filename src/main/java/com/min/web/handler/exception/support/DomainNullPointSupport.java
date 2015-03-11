package com.min.web.handler.exception.support;

import lombok.Getter;

public class DomainNullPointSupport extends NullPointerException {
	
	private static final long serialVersionUID = 1L;
	@Getter
	private long seq;
	@Getter
	private String domainName;
	
	public DomainNullPointSupport(long seq, String domainName){
		this.seq = seq;
		this.domainName = domainName;
	}
	
}
