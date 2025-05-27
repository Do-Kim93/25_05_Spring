package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleReplyRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ArticleReply;
import com.example.demo.vo.ResultData;

@Service
public class ArticleReplyService {

	@Autowired
	private ArticleReplyRepository articleReplyRepository;

	public ArticleReplyService(ArticleReplyRepository articleReplyRepository) {
		this.articleReplyRepository = articleReplyRepository;
	}

	public ResultData writeArticle(int memberId, String title, String body, String boardId) {
		articleReplyRepository.writeArticle(memberId, title, body, boardId);

		int id = articleReplyRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 글이 등록되었습니다", id), "등록 된 게시글 id", id);
	}

	public void deleteArticle(int id) {
		articleReplyRepository.deleteArticle(id);
	}

	public void modifyArticle(int id, String title, String body) {
		articleReplyRepository.modifyArticle(id, title, body);
	}

	public ResultData userCanModify(int loginedMemberId, ArticleReply articleReply) {

		if (articleReply.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 게시글에 대한 수정 권한 없음", articleReply.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글 수정 가능", articleReply.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, ArticleReply articleReply) {
		if (articleReply.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 게시글에 대한 삭제 권한 없음", articleReply.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글 삭제 가능", articleReply.getId()));
	}

	public List<ArticleReply> getForPrintArticleReplys(int loginedMemberId, int id) {

		return articleReplyRepository.getForPrintArticleReplys(id);
	}

	private void controlForPrintData(int loginedMemberId, ArticleReply articleReply) {
		if (articleReply == null) {
			return;
		}

		ResultData userCanModifyRd = userCanModify(loginedMemberId, articleReply);
		articleReply.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userDeleteRd = userCanDelete(loginedMemberId, articleReply);
		articleReply.setUserCanDelete(userDeleteRd.isSuccess());
	}

	public ArticleReply getArticleById(int id) {
		return articleReplyRepository.getArticleById(id);
	}

	public List<Article> getArticles() {
		return articleReplyRepository.getArticles();
	}

	public List<ArticleReply> getForPrintArticles(int loginedMemberId, int id) {

		return articleReplyRepository.getForPrintArticleReplys(id);
	}

	public int getArticleCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return articleReplyRepository.getArticleCount(boardId, searchKeywordTypeCode, searchKeyword);
	}


//	public ResultData increaseGoodReactionPoint(int relId) {
//		int affectedRow = articleRepository.increaseGoodReactionPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "없는 게시물");
//		}
//
//		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
//	}
//
//	public ResultData increaseBadReactionPoint(int relId) {
//		int affectedRow = articleRepository.increaseBadReactionPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "없는 게시물");
//		}
//
//		return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
//	}
//
//	public ResultData decreaseGoodReactionPoint(int relId) {
//		int affectedRow = articleRepository.decreaseGoodReactionPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "없는 게시물");
//		}
//
//		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
//	}
//
//	public ResultData decreaseBadReactionPoint(int relId) {
//		int affectedRow = articleRepository.decreaseBadReactionPoint(relId);
//
//		if (affectedRow == 0) {
//			return ResultData.from("F-1", "없는 게시물");
//		}
//
//		return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
//	}
//
//	public int getGoodRP(int relId) {
//		return articleRepository.getGoodRP(relId);
//	}
//
//	public int getBadRP(int relId) {
//		return articleRepository.getBadRP(relId);
//	}

}