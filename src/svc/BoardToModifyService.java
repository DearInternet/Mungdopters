package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardToModifyService {

	public BoardBean getArticle(int b_ask_num) throws Exception{
		// TODO Auto-generated method stub
		
		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		article = boardDAO.selectArticle(b_ask_num);
		// b_ask_num번의 게시글의 모든 정보를 Boardbean board 형태로 가져왔음.
		close(con);
		return article;
		
	}

}
