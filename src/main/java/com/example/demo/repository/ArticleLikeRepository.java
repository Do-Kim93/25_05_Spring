package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ArticleLikeRepository {
	public int getLikeCount(int articleId);

	public int isLiked(int articleId, int memberId);

	public void insertLike(int articleId, int memberId);

	public void deleteLike(int articleId, int memberId);
}