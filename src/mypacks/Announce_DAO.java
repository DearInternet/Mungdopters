package mypacks;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;

public class Announce_DAO
{
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWD = "9697aa";
    private Connection con;
    private Statement stmt;
    
    public Announce_DAO() {
        this.con = null;
        this.stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void connect() {
        try {
            this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8", "root", "9697aa");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void disconnect() {
        if (this.stmt != null) {
            try {
                this.stmt.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (this.con != null) {
            try {
                this.con.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void update(final String title, final String photo, final String content, final int number) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("update board_announce set b_announce_title = '" + title + "', b_announce_photo = '" + photo + "', b_announce_content = '" + content + "', b_announce_date = now() where b_announce_number = " + number + ";");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public void insert(final String id, final String title, final String photo, final String content) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("insert into board_announce(m_id, b_announce_date, b_announce_title, b_announce_photo, b_announce_content) values('" + id + "', now() , '" + title + "', '" + photo + "', '" + content + "');");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public void delete(final int contentnumdel) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("delete from board_announce where b_announce_number = " + contentnumdel + ";");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public ArrayList<DTO> select() {
        this.connect();
        final ArrayList<DTO> board_announce = new ArrayList<DTO>();
        try {
            this.stmt = this.con.createStatement();
            final ResultSet rs = this.stmt.executeQuery("select b_announce_number, b_announce_title, m_id, b_announce_date, b_announce_content from board_announce;");
            while (rs.next()) {
                final DTO dtobj = new DTO();
                dtobj.setB_announce_number(rs.getInt("b_announce_number"));
                dtobj.setB_announce_title(rs.getString("b_announce_title"));
                dtobj.setM_id(rs.getString("m_id"));
                dtobj.setB_announce_date(rs.getString("b_announce_date"));
                dtobj.setB_announce_content(rs.getString("b_announce_content"));
                board_announce.add(dtobj);
            }
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            return board_announce;
        }
        finally {
            this.disconnect();
        }
        this.disconnect();
        return board_announce;
    }
}