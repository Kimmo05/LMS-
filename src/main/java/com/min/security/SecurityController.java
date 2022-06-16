package com.min.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


import com.min.service.IMemberService;
import com.min.vo.MemberVo;




public class SecurityController implements UserDetailsService {

	@Autowired
	private IMemberService service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("------------------"+"AdminSecurityController 작동중");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", username);
		MemberVo dto = service.loginTra(map);
		if(dto == null) {
			 dto = service.loginIns(map);
			System.out.println("------------------"+username);
			System.out.println("------------------"+dto.getPw());
			
			
			List <SimpleGrantedAuthority> rolesIns = new ArrayList<SimpleGrantedAuthority>();

			rolesIns.add(new SimpleGrantedAuthority(dto.getAuth())); // ADMIN
			
			UserDetails userIns = new User(username,dto.getPw(),rolesIns); // nobrand01, 1234(암호), role
			return userIns;
		}else {
		System.out.println("------------------"+username);
		System.out.println("------------------"+dto.getPw());
		
		
		List <SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

		roles.add(new SimpleGrantedAuthority(dto.getAuth())); // ADMIN
		
		UserDetails user = new User(username,dto.getPw(),roles); // nobrand01, 1234(암호), role
		
		return user;
		}
	}


}
