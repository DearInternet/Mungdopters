package adopt;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.Connection;

public class Adopt_Wait_DAO {
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8";
	private static final String USER = "root";
	private static final String PASSWD = "9697aa";
	private Connection con;
	private Statement stmt;

	public Adopt_Wait_DAO() {
		this.con = null;
		this.stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void connect() {
		try {
			this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8",
					"root", "9697aa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		if (this.stmt != null) {
			try {
				this.stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (this.con != null) {
			try {
				this.con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static int codegen() {
		Date temp = new Date();
	        
	    SimpleDateFormat date = new SimpleDateFormat("MMddhhmmss");
	        
	    int code = Integer.parseInt(date.format(temp));
	    
	    return code;
	}
	
	
	
	public int insert(String d_info_type, String d_info_name, String d_info_sex, String d_info_neutralize, int d_info_age, String d_info_photo) {

		this.connect();
		int result = 0;
		int d_info_code = codegen();
		
		try {
			this.stmt = this.con.createStatement();
			result = this.stmt.executeUpdate(
					"insert into dog_information(d_info_code, d_info_type, d_info_name, d_info_sex, d_info_neutralize, d_info_date, d_info_age, d_info_photo) values('"
							+ d_info_code + "', '" + d_info_type + "', '" + d_info_name + "', '" + d_info_sex + "', '" + d_info_neutralize + "', "
							+ "now()" + ", '" + d_info_age + "', '" + d_info_photo + "');");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.disconnect();
		return result;
	}

	public ArrayList<Adopt_Wait_DTO> select(final int d_info_code) {
		this.connect();
		final ArrayList<Adopt_Wait_DTO> adopt_wait_dto = new ArrayList<Adopt_Wait_DTO>();
		try {
			this.stmt = this.con.createStatement();

			final ResultSet rs = this.stmt.executeQuery(
					"select d_info_type, d_info_name, d_info_sex, d_info_neutralize, d_info_date, d_info_age, d_info_photo from dog_information where d_info_code = '"
							+ d_info_code + "';");
			while (rs.next()) {
				final Adopt_Wait_DTO dtobj = new Adopt_Wait_DTO();
				dtobj.setD_info_code(d_info_code);
				dtobj.setD_info_type(rs.getString("d_info_type"));
				dtobj.setD_info_name(rs.getString("d_info_name"));
				dtobj.setD_info_sex(rs.getString("d_info_sex"));
				dtobj.setD_info_neutralize(rs.getString("d_info_neutralize"));
				dtobj.setD_info_date(rs.getDate("d_info_date"));
				dtobj.setD_info_age(rs.getInt("d_info_age"));
				dtobj.setD_info_photo(rs.getString("d_info_photo"));
				adopt_wait_dto.add(dtobj);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return adopt_wait_dto;
		} finally {
			this.disconnect();
		}
		this.disconnect();
		return adopt_wait_dto;
	}

	
	public ArrayList<Adopt_Wait_DTO> selectquantity(final int start, final int quantity) {
		this.connect();
		final ArrayList<Adopt_Wait_DTO> adopt_wait_dto = new ArrayList<Adopt_Wait_DTO>();
		try {
			this.stmt = this.con.createStatement();

			final ResultSet rs = this.stmt.executeQuery(
					"select d_info_code, d_info_type, d_info_name, d_info_sex, d_info_neutralize, d_info_date, d_info_age, d_info_photo from dog_information order by d_info_code limit " + start + "," + quantity + ";");
			while (rs.next()) {
				final Adopt_Wait_DTO dtobj = new Adopt_Wait_DTO();
				dtobj.setD_info_code(rs.getInt("d_info_code"));
				dtobj.setD_info_type(rs.getString("d_info_type"));
				dtobj.setD_info_name(rs.getString("d_info_name"));
				dtobj.setD_info_sex(rs.getString("d_info_sex"));
				dtobj.setD_info_neutralize(rs.getString("d_info_neutralize"));
				dtobj.setD_info_date(rs.getDate("d_info_date"));
				dtobj.setD_info_age(rs.getInt("d_info_age"));
				dtobj.setD_info_photo(rs.getString("d_info_photo"));
				adopt_wait_dto.add(dtobj);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return adopt_wait_dto;
		} finally {
			this.disconnect();
		}
		this.disconnect();
		return adopt_wait_dto;
	}
}