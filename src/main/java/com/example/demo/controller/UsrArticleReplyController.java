package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.interceptor.BeforeActionInterceptor;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ArticleReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.ArticleReply;
import com.example.demo.vo.Board;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrArticleReplyController {

	private final BeforeActionInterceptor beforeActionInterceptor;

	@Autowired
	private Rq rq;

	@Autowired
	private ArticleReplyService articleReplyService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReactionPointService reactionPointService;

	UsrArticleReplyController(BeforeActionInterceptor beforeActionInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
	}

//	@RequestMapping("/usr/article/modify")
//	public String showModify(HttpServletRequest req, Model model, int id) {
//
//		Rq rq = (Rq) req.getAttribute("rq");
//
//		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
//
//		if (article == null) {
//			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
//		}
//
//		model.addAttribute("article", article);
//
//		return "/usr/article/modify";
//	}

//	// 로그인 체크 -> 유무 체크 -> 권한체크
//	@RequestMapping("/usr/article/doModify")
//	@ResponseBody
//	public String doModify(HttpServletRequest req, int id, String title, String body) {
//
//		Rq rq = (Rq) req.getAttribute("rq");
//
//		Article article = articleService.getArticleById(id);
//
//		if (article == null) {
//			return Ut.jsReplace("F-1", Ut.f("%d번 게시글은 없습니다", id), "../article/list");
//		}
//
//		ResultData userCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);
//
//		if (userCanModifyRd.isFail()) {
//			return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
//		}
//
//		if (userCanModifyRd.isSuccess()) {
//			articleService.modifyArticle(id, title, body);
//		}
//
//		article = articleService.getArticleById(id);
//
//		return Ut.jsReplace(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(), "../article/detail?id=" + id);
//	}

//	@RequestMapping("/usr/article/doDelete")
//	@ResponseBody
//	public String doDelete(HttpServletRequest req, int id) {
//
//		Rq rq = (Rq) req.getAttribute("rq");
//
//		Article article = articleService.getArticleById(id);
//
//		if (article == null) {
//			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다", id));
//		}
//
//		ResultData userCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);
//
//		if (userCanDeleteRd.isFail()) {
//			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
//		}
//
//		if (userCanDeleteRd.isSuccess()) {
//			articleService.deleteArticle(id);
//		}
//
//		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../article/list");
//	}


	@RequestMapping("/usr/articleReply/write")
	public String showWrite(HttpServletRequest req) {

		return "usr/articleReply/write";
	}

	@RequestMapping("/usr/articleReply/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String title, String body, String boardId) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (Ut.isEmptyOrNull(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력하세요");
		}

		if (Ut.isEmptyOrNull(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력하세요");
		}

		if (Ut.isEmptyOrNull(boardId)) {
			return Ut.jsHistoryBack("F-3", "게시판을 선택하세요");
		}

		ResultData doWriteRd = articleReplyService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);

		int id = (int) doWriteRd.getData1();

		ArticleReply articleReply = articleReplyService.getArticleById(id);

		return Ut.jsReplace(doWriteRd.getResultCode(), doWriteRd.getMsg(), "../article/detail?id=" + id);
	}
}