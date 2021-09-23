package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import adopt.Adopt_Wait_DAO;
import adopt.Adopt_Wait_DTO;
import vo.BoardBean;
import dao.BoardDAO;

public class SendToAdoptWaitService {

	public boolean sendArticle(Adopt_Wait_DTO article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isSendingSuccess = false;
		
		Adopt_Wait_DAO adoptwaitsend = new Adopt_Wait_DAO();
		
		int result = adoptwaitsend.insert(article.getD_info_type(), article.getD_info_name(), article.getD_info_sex(), article.getD_info_neutralize(), article.getD_info_age(), article.getD_info_photo());

		if(result > 0){

			isSendingSuccess=true;
		}
		else{
			
			isSendingSuccess = false;
		}
		

		return isSendingSuccess;
		
	}

}
