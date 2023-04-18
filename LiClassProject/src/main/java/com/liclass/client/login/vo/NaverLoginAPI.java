package com.liclass.client.login.vo;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginAPI extends DefaultApi20 { //은아
	protected NaverLoginAPI() {
	}

	private static class InstanceHolder {
		private static final NaverLoginAPI INSTANCE = new NaverLoginAPI();
	}

	public static NaverLoginAPI instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
