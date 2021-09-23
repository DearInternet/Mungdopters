package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;
import vo.EntranceBean;

public class EntranceAdminService {

	public int getEntranceListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectEntranceListCount(); // select count(*) from entrance_ready
		close(con);
		return listCount;
		
	}

	public ArrayList<EntranceBean> getArticleList(int page) throws Exception{
		
		ArrayList<EntranceBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectEntranceArticleList(page);
		close(con);
		return articleList;
		
	}

}
