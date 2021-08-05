package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.BoardBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	public int selectListCount() {
		// 전체 게시글 갯수
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from board_ask");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){		
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectArticleList(int page){
		// 게시글 페이지에 10개(이하일시 그 개수만큼) 가져옴
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from board_ask order by b_ask_grpnum desc,b_ask_grpseq asc limit ?,10";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(page-1)*10; 	

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setB_ask_number(rs.getInt("b_ask_number"));
				board.setM_id(rs.getString("m_id"));
				board.setB_ask_title(rs.getString("b_ask_title"));
				board.setB_ask_content(rs.getString("b_ask_content"));
				board.setB_ask_file(rs.getString("b_ask_file"));
				board.setB_ask_grpnum(rs.getInt("b_ask_grpnum"));
				board.setB_ask_grplvl(rs.getInt("b_ask_grplvl"));
				board.setB_ask_grpseq(rs.getInt("b_ask_grpseq"));
				board.setB_ask_count(rs.getInt("b_ask_count"));
				board.setB_ask_date(rs.getDate("b_ask_date"));
				articleList.add(board);
			}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	public int updateReadCount(int b_ask_num){
		// 조회수증가

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board_ask set b_ask_count = b_ask_count+1 where b_ask_number = "+ b_ask_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			close(pstmt);
		}
		return updateCount;
	}

	public BoardBean selectArticle(int b_ask_num){
		// 게시글 상세정보
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean board = null;

		try{
			pstmt = con.prepareStatement(
					"select * from board_ask where b_ask_number = ?");
			pstmt.setInt(1, b_ask_num);
			rs= pstmt.executeQuery();

			if(rs.next()){
				board = new BoardBean();
				board.setB_ask_number(rs.getInt("b_ask_number"));
				board.setM_id(rs.getString("m_id"));
				board.setB_ask_title(rs.getString("b_ask_title"));
				board.setB_ask_content(rs.getString("b_ask_content"));
				board.setB_ask_file(rs.getString("b_ask_file"));
				board.setB_ask_grpnum(rs.getInt("b_ask_grpnum"));
				board.setB_ask_grplvl(rs.getInt("b_ask_grplvl"));
				board.setB_ask_grpseq(rs.getInt("b_ask_grpseq"));
				board.setB_ask_count(rs.getInt("b_ask_count"));
				board.setB_ask_date(rs.getDate("b_ask_date"));
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return board;
	}
	
	public int updateArticle(BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update board_ask set b_ask_title =?, b_ask_content =? where b_ask_number=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getB_ask_title());
			pstmt.setString(2, article.getB_ask_content());
			pstmt.setInt(3, article.getB_ask_number());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	
	public int deleteArticle(int b_ask_num){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from board_ask where b_ask_number=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, b_ask_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("Error : "+e);
		}	finally{
			close(pstmt);
		}
		return deleteCount;

	}
	
	public int insertArticle(BoardBean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(b_ask_number) from board_ask");
			rs = pstmt.executeQuery();
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board_ask (b_ask_number,m_id,b_ask_title,";
			sql+="b_ask_content, b_ask_file, b_ask_grpnum,"+
					"b_ask_grplvl,b_ask_grpseq,b_ask_count,"+
					"b_ask_date) values(?,?,?,?,?,?,?,?,?,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getM_id());
			pstmt.setString(3, article.getB_ask_title());
			pstmt.setString(4, article.getB_ask_content());
			pstmt.setString(5, article.getB_ask_file());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	public int insertReplyArticle(BoardBean article){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql="select max(b_ask_number) from board_ask"; //게시글번호 생성
		String sql="";
		int num=0;
		int insertCount=0;
		int b_ask_grpnum=article.getB_ask_grpnum();
		int b_ask_grplvl=article.getB_ask_grplvl();
		int b_ask_grpseq=article.getB_ask_grpseq();

		try{
			pstmt=con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next())num =rs.getInt(1)+1;
			else num=1;
			sql="update board_ask set b_ask_grpseq=b_ask_grpseq+1 where b_ask_grpnum=? ";
			sql+="and b_ask_grpseq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,b_ask_grpnum);
			pstmt.setInt(2,b_ask_grpseq);
			int updateCount=pstmt.executeUpdate();

			if(updateCount > 0){
				commit(con);
			}

			b_ask_grpseq = b_ask_grpseq + 1;
			b_ask_grplvl = b_ask_grplvl+1;
			sql="insert into board_ask (b_ask_number,m_id,b_ask_title,";
			sql+="b_ask_content, b_ask_file,b_ask_grpnum,b_ask_grplvl,b_ask_grpseq,";
			sql+="b_ask_count,b_ask_date) values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getM_id());
			pstmt.setString(3, article.getB_ask_title());
			pstmt.setString(4, article.getB_ask_content());
			pstmt.setString(5, ""); 
			pstmt.setInt(6, b_ask_grpnum);
			pstmt.setInt(7, b_ask_grplvl);
			pstmt.setInt(8, b_ask_grpseq);
			pstmt.setInt(9, 0);
			insertCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
}
