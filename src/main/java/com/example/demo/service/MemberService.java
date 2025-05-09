package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public int doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {

		Member existsMember = getMemberByLoginId(loginId);
		System.out.println("existsMember : " + existsMember);

		if (existsMember != null) {
			return -1;
		}
		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return -2;
		}


		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		return memberRepository.getLastInsertId();
	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name,email);
	}

	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public ResultData login(String loginId, String loginPw) {
		Member loginMember = memberRepository.getMemberByLoginId(loginId);
		if (loginMember == null) {
			return ResultData.from("F-1", Ut.f("잘못된 아이디 입니다."), loginId);
		}
		if (!loginMember.getLoginPw().equals(loginPw)) {
			return ResultData.from("F-2", Ut.f("잘못된 비밀번호 입니다."));
		}
		return ResultData.from("S-1", Ut.f("%s회원님 반갑습니다", loginId), loginId);
	}

}