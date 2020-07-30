package com.shop.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.shop.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.shop.mappers.memberMapper";

	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".signup", vo);

	}
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
}
