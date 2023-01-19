package com.ezen.delivery.security.oauth2;

import java.util.UUID;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.ezen.delivery.domain.UserVO;
import com.ezen.delivery.repository.UserDAO;
import com.ezen.delivery.security.oauth2.userinfo.GoogleUserInfo;
import com.ezen.delivery.security.oauth2.userinfo.NaverUserInfo;
import com.ezen.delivery.security.oauth2.userinfo.OAuth2UserInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PrincipalOauth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	@Inject 
	private UserDAO udao;
    
	@Inject
	private PasswordEncoder bCryptPasswordEncoder;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    	
    	log.info("principalservice");
    	OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = null;
        
        OAuth2UserInfo oAuth2UserInfo = null;	//추가
        String provider = userRequest.getClientRegistration().getRegistrationId();    
        
        //추가
        if(provider.equals("google")){
        	log.info("google in");
            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
        }
        else if(provider.equals("naver")){
            oAuth2UserInfo = new NaverUserInfo(oAuth2User.getAttributes());
        }
        
        String providerId = oAuth2UserInfo.getProviderId();	//수정
        String username = provider+"_"+providerId;  			

        String uuid = UUID.randomUUID().toString().substring(0, 6);
        String password = bCryptPasswordEncoder.encode("패스워드"+uuid); 

        String email = oAuth2UserInfo.getEmail();	//수정
        String role = "USER";

        UserVO byUsername = udao.getUser(username);
        
        //DB에 없는 사용자라면 회원가입처리
        if(byUsername == null){
            byUsername = new UserVO();
            byUsername.setUser_id(username);
            byUsername.setUser_pw(password);
            byUsername.setUser_email(email);
            byUsername.setUser_Role(role);
            byUsername.setProvider(provider);
            byUsername.setProviderId(providerId);
            udao.insertUser(byUsername);
        }

        return new PrincipalDetails(byUsername, oAuth2UserInfo);	//수정
    }
}
