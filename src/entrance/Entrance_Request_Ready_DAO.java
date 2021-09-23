package entrance;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;

public class Entrance_Request_Ready_DAO
{
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWD = "9697aa";
    private Connection con;
    private Statement stmt;
    
    public Entrance_Request_Ready_DAO() {
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
    
    public void update(String m_id, String r_type, String r_name, String r_sex, int r_age, String r_neutralize, String r_photo, String r_addition) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("update entrance_ready set r_type = '" + r_type + "', r_name = '" + r_name + "', r_sex = '" + r_sex + "', r_age = '" + r_age + "', r_neutralize = '" + r_neutralize + "', r_photo = '" + r_photo + "', r_addition = '" + r_addition + "' where m_id = '" + m_id + "';");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public void insert(String m_id, String r_type, String r_name, String r_sex, int r_age, String r_neutralize, String r_photo, String r_addition) {
    	
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("insert into entrance_ready(m_id, r_type, r_name, r_sex, r_age, r_neutralize, r_photo, r_addition) values('" + m_id + "', '" + r_type + "', '" + r_name + "', '" + r_sex + "', '" + r_age + "', '" + r_neutralize + "', '" + r_photo + "', '" + r_addition + "');");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public void delete(String m_id) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("delete from entrance_ready where m_id = " + m_id + ";");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public ArrayList<Entrance_Request_Ready_DTO> select(String m_id) {
        this.connect();
        final ArrayList<Entrance_Request_Ready_DTO> ent_req_ready = new ArrayList<Entrance_Request_Ready_DTO>();
        try {
            this.stmt = this.con.createStatement();
            final ResultSet rs = this.stmt.executeQuery("select r_type, r_name, r_sex, r_age, r_neutralize, r_photo, r_addition from entrance_ready where m_id = '"+m_id+"';");
            while (rs.next()) {
                final Entrance_Request_Ready_DTO dtobj = new Entrance_Request_Ready_DTO();
                dtobj.setM_id(m_id);
                dtobj.setR_type(rs.getString("r_type"));
                dtobj.setR_name(rs.getString("r_name"));
                dtobj.setR_sex(rs.getString("r_sex"));
                dtobj.setR_age(rs.getInt("r_age"));
                dtobj.setR_neutralize(rs.getString("r_neutralize"));
                dtobj.setR_photo(rs.getString("r_photo"));
                dtobj.setR_addition(rs.getString("r_addition"));
                ent_req_ready.add(dtobj);
            }
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            return ent_req_ready;
        }
        finally {
            this.disconnect();
        }
        this.disconnect();
        return ent_req_ready;
    }
}