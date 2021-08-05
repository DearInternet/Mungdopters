package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

 public class BoardListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		BoardListService boardListService = new BoardListService();
		int listCount=boardListService.getListCount();
		// select count(*) from board_ask 총 리스트 수를 받아옴.
		
		articleList = boardListService.getArticleList(page); 
		//select * from board_ask order by b_ask_grpnum desc,b_ask_grpseq asc limit [page-1],10. 해놓고 
		//board_ask에서 grpnum(참조하는 본문게시글의 글번호) 내림차순정렬후 같을시 grpseq(덧글의 순서) 오름차순 10개가져옴.
		//즉 같은 grpnum에선 grpseq가 같으면 안됨.
		//Boardbean boardbean ArrayList로 저장후 반환
		
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		//0.95를 더해서 올림 처리.

   		int startPage = ( ((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		// page가 1~10일경우 startpage = 1 11~20일경우 startpage = 11 

   	    int endPage = startPage+10-1;
   	   	//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    
   		if (endPage> maxPage) endPage= maxPage;

   		//이 밑으로 전부다 page가 정해져야 시작함.
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage); // 10, 20...이며 maxPage값보다 거질경우 maxPage값으로 변경.
   		//ex) 게시글이 87개일 경우 maxPage=9가 되고, endPage는 10이 될수없으므로 9가됨.
   		//ex2) 게시글이 129개일 경우 maxPage=13이 되고, endPage는 startPage가 1일시 10, startPage가 2일시 20이되야하는데 안되므로 13.
   		pageInfo.setListCount(listCount); // 전체 게시글 개수
		pageInfo.setMaxPage(maxPage); // 전체 페이지 ex)게시글이 402개일시 maxPage = 41
		pageInfo.setPage(page); // 초기값1. 페이지 넘어갈시 jsp에서 nowpage+1값 파라미터로
		pageInfo.setStartPage(startPage); // page에 따른 시작페이지 1, 11, 21...
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList); //10개씩 자른거.
		ActionForward forward= new ActionForward();
   		forward.setPath("/board/board_ask_List.jsp");
   		return forward;
   		
	 }
	 
 }